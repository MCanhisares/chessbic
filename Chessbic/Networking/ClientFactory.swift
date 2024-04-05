//
//  ClientFactory.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2024-04-05.
//
import NIO
import GRPC

protocol EventLoopProvider: AnyObject {

    // Expose the underlying EventLoop(s) in case we want to run work on it.
    var eventLoop: EventLoop { get }
}

protocol ClientFactory: EventLoopProvider {

    func ChessServiceClient() -> ChessServer_MatchClientProtocol
    func AuthServiceClient() -> Authentication_AuthenticationClientProtocol
    
}

final class DefaultClientFactory {

    static let shared = DefaultClientFactory(host: "localhost", port: 50051)
    
    enum Header: String {
        case appVersion = "app-version"
        case appInstance = "app-instance"
    }

    // GRPC Performance best practices:
    // https://grpc.io/docs/guides/performance/

    // On Apple platforms the returned EventLoopGroup uses the Network.framework,
    // and each EventLoop is backed by a DispatchQueue.
    private lazy var eventLoopGroup = PlatformSupport.makeEventLoopGroup(loopCount: 1)

    private lazy var sharedChannel: GRPCChannel = {
        do {
            return try GRPCChannelPool.with(
                target: .host(host, port: port),
                transportSecurity: .plaintext,
                eventLoopGroup: eventLoopGroup
            ) { configuration in
                // Additional configuration, like keepalive.
                // Note: Keepalive should in most circumstances not be necessary.
                configuration.keepalive = ClientConnectionKeepalive(
                    interval: .seconds(15),
                    timeout: .seconds(10)
                )
            }
        } catch {
            fatalError("Failed to open GRPC channel")
        }
    }()

    private let host: String
    private let port: Int

    // Shared metadata/headers across all GRPCClients
    private lazy var sharedHeaders: [Header: String] = [:]

    private var sharedChessServiceClient: ChessServer_MatchClientProtocol?
    private var sharedAuthenticationServiceClient: Authentication_AuthenticationClientProtocol?
    

    private init(host: String, port: Int) {
        self.host = host
        self.port = port
    }
}

// MARK: Public methods

extension DefaultClientFactory {

    // Expose the option to set shared client stub headers
    func set(header: Header, value: String?) {
        sharedHeaders[header] = value

        sharedChessServiceClient?.defaultCallOptions.customMetadata = .init(
            sharedHeaders.map { ($0.rawValue, $1) }
        )
    }
}

// MARK: ClientFactory

extension DefaultClientFactory: ClientFactory {
    
    var eventLoop: EventLoop {
        eventLoopGroup.any()
    }

    func ChessServiceClient() -> ChessServer_MatchClientProtocol {
        if let ChessServiceClient = sharedChessServiceClient {
            return ChessServiceClient
        }

        let ChessServiceClient = ChessServer_MatchNIOClient(
            channel: sharedChannel,
            defaultCallOptions: .init(
                customMetadata: .init(sharedHeaders.map { ($0.rawValue, $1) }),
                timeLimit: .timeout(.seconds(15))
            ),
            interceptors: nil // Optionally interceptors
        )

        sharedChessServiceClient = ChessServiceClient

        return ChessServiceClient
    }
    
    func AuthServiceClient() -> Authentication_AuthenticationClientProtocol {
        if let AuthenticationServiceClient = sharedAuthenticationServiceClient {
            return AuthenticationServiceClient
        }

        let AuthenticationServiceClient = Authentication_AuthenticationNIOClient(
            channel: sharedChannel,
            defaultCallOptions: .init(
                customMetadata: .init(sharedHeaders.map { ($0.rawValue, $1) }),
                timeLimit: .timeout(.seconds(15))
            ),
            interceptors: nil // Optionally interceptors
        )

        sharedAuthenticationServiceClient = AuthenticationServiceClient

        return AuthenticationServiceClient
    }
}
