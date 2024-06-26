//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: chess_server.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `ChessServer_MatchClient`, then call methods of this protocol to make API calls.
public protocol ChessServer_MatchClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? { get }

  func movePiece(
    _ request: ChessServer_MoveRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<ChessServer_MoveRequest, ChessServer_MoveResponse>
}

extension ChessServer_MatchClientProtocol {
  public var serviceName: String {
    return "chess_server.Match"
  }

  /// Unary call to MovePiece
  ///
  /// - Parameters:
  ///   - request: Request to send to MovePiece.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func movePiece(
    _ request: ChessServer_MoveRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<ChessServer_MoveRequest, ChessServer_MoveResponse> {
    return self.makeUnaryCall(
      path: ChessServer_MatchClientMetadata.Methods.movePiece.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMovePieceInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension ChessServer_MatchClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "ChessServer_MatchNIOClient")
public final class ChessServer_MatchClient: ChessServer_MatchClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: ChessServer_MatchClientInterceptorFactoryProtocol?
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  public var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the chess_server.Match service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

public struct ChessServer_MatchNIOClient: ChessServer_MatchClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol?

  /// Creates a client for the chess_server.Match service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol ChessServer_MatchAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? { get }

  func makeMovePieceCall(
    _ request: ChessServer_MoveRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<ChessServer_MoveRequest, ChessServer_MoveResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension ChessServer_MatchAsyncClientProtocol {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return ChessServer_MatchClientMetadata.serviceDescriptor
  }

  public var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? {
    return nil
  }

  public func makeMovePieceCall(
    _ request: ChessServer_MoveRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<ChessServer_MoveRequest, ChessServer_MoveResponse> {
    return self.makeAsyncUnaryCall(
      path: ChessServer_MatchClientMetadata.Methods.movePiece.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMovePieceInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension ChessServer_MatchAsyncClientProtocol {
  public func movePiece(
    _ request: ChessServer_MoveRequest,
    callOptions: CallOptions? = nil
  ) async throws -> ChessServer_MoveResponse {
    return try await self.performAsyncUnaryCall(
      path: ChessServer_MatchClientMetadata.Methods.movePiece.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMovePieceInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct ChessServer_MatchAsyncClient: ChessServer_MatchAsyncClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol?

  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

public protocol ChessServer_MatchClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'movePiece'.
  func makeMovePieceInterceptors() -> [ClientInterceptor<ChessServer_MoveRequest, ChessServer_MoveResponse>]
}

public enum ChessServer_MatchClientMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Match",
    fullName: "chess_server.Match",
    methods: [
      ChessServer_MatchClientMetadata.Methods.movePiece,
    ]
  )

  public enum Methods {
    public static let movePiece = GRPCMethodDescriptor(
      name: "MovePiece",
      path: "/chess_server.Match/MovePiece",
      type: GRPCCallType.unary
    )
  }
}

@available(swift, deprecated: 5.6)
extension ChessServer_MatchTestClient: @unchecked Sendable {}

@available(swift, deprecated: 5.6, message: "Test clients are not Sendable but the 'GRPCClient' API requires clients to be Sendable. Using a localhost client and server is the recommended alternative.")
public final class ChessServer_MatchTestClient: ChessServer_MatchClientProtocol {
  private let fakeChannel: FakeChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: ChessServer_MatchClientInterceptorFactoryProtocol?

  public var channel: GRPCChannel {
    return self.fakeChannel
  }

  public init(
    fakeChannel: FakeChannel = FakeChannel(),
    defaultCallOptions callOptions: CallOptions = CallOptions(),
    interceptors: ChessServer_MatchClientInterceptorFactoryProtocol? = nil
  ) {
    self.fakeChannel = fakeChannel
    self.defaultCallOptions = callOptions
    self.interceptors = interceptors
  }

  /// Make a unary response for the MovePiece RPC. This must be called
  /// before calling 'movePiece'. See also 'FakeUnaryResponse'.
  ///
  /// - Parameter requestHandler: a handler for request parts sent by the RPC.
  public func makeMovePieceResponseStream(
    _ requestHandler: @escaping (FakeRequestPart<ChessServer_MoveRequest>) -> () = { _ in }
  ) -> FakeUnaryResponse<ChessServer_MoveRequest, ChessServer_MoveResponse> {
    return self.fakeChannel.makeFakeUnaryResponse(path: ChessServer_MatchClientMetadata.Methods.movePiece.path, requestHandler: requestHandler)
  }

  public func enqueueMovePieceResponse(
    _ response: ChessServer_MoveResponse,
    _ requestHandler: @escaping (FakeRequestPart<ChessServer_MoveRequest>) -> () = { _ in }
  ) {
    let stream = self.makeMovePieceResponseStream(requestHandler)
    // This is the only operation on the stream; try! is fine.
    try! stream.sendMessage(response)
  }

  /// Returns true if there are response streams enqueued for 'MovePiece'
  public var hasMovePieceResponsesRemaining: Bool {
    return self.fakeChannel.hasFakeResponseEnqueued(forPath: ChessServer_MatchClientMetadata.Methods.movePiece.path)
  }
}

