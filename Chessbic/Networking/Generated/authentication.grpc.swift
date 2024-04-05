//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: authentication.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `Authentication_AuthenticationClient`, then call methods of this protocol to make API calls.
public protocol Authentication_AuthenticationClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? { get }

  func authenticate(
    _ request: Authentication_AuthRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Authentication_AuthRequest, Authentication_AuthResponse>
}

extension Authentication_AuthenticationClientProtocol {
  public var serviceName: String {
    return "authentication.Authentication"
  }

  /// Unary call to Authenticate
  ///
  /// - Parameters:
  ///   - request: Request to send to Authenticate.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func authenticate(
    _ request: Authentication_AuthRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Authentication_AuthRequest, Authentication_AuthResponse> {
    return self.makeUnaryCall(
      path: Authentication_AuthenticationClientMetadata.Methods.authenticate.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAuthenticateInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Authentication_AuthenticationClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Authentication_AuthenticationNIOClient")
public final class Authentication_AuthenticationClient: Authentication_AuthenticationClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol?
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  public var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the authentication.Authentication service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

public struct Authentication_AuthenticationNIOClient: Authentication_AuthenticationClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol?

  /// Creates a client for the authentication.Authentication service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Authentication_AuthenticationAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? { get }

  func makeAuthenticateCall(
    _ request: Authentication_AuthRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Authentication_AuthRequest, Authentication_AuthResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Authentication_AuthenticationAsyncClientProtocol {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return Authentication_AuthenticationClientMetadata.serviceDescriptor
  }

  public var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? {
    return nil
  }

  public func makeAuthenticateCall(
    _ request: Authentication_AuthRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Authentication_AuthRequest, Authentication_AuthResponse> {
    return self.makeAsyncUnaryCall(
      path: Authentication_AuthenticationClientMetadata.Methods.authenticate.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAuthenticateInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Authentication_AuthenticationAsyncClientProtocol {
  public func authenticate(
    _ request: Authentication_AuthRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Authentication_AuthResponse {
    return try await self.performAsyncUnaryCall(
      path: Authentication_AuthenticationClientMetadata.Methods.authenticate.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAuthenticateInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct Authentication_AuthenticationAsyncClient: Authentication_AuthenticationAsyncClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol?

  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

public protocol Authentication_AuthenticationClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'authenticate'.
  func makeAuthenticateInterceptors() -> [ClientInterceptor<Authentication_AuthRequest, Authentication_AuthResponse>]
}

public enum Authentication_AuthenticationClientMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Authentication",
    fullName: "authentication.Authentication",
    methods: [
      Authentication_AuthenticationClientMetadata.Methods.authenticate,
    ]
  )

  public enum Methods {
    public static let authenticate = GRPCMethodDescriptor(
      name: "Authenticate",
      path: "/authentication.Authentication/Authenticate",
      type: GRPCCallType.unary
    )
  }
}

@available(swift, deprecated: 5.6)
extension Authentication_AuthenticationTestClient: @unchecked Sendable {}

@available(swift, deprecated: 5.6, message: "Test clients are not Sendable but the 'GRPCClient' API requires clients to be Sendable. Using a localhost client and server is the recommended alternative.")
public final class Authentication_AuthenticationTestClient: Authentication_AuthenticationClientProtocol {
  private let fakeChannel: FakeChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol?

  public var channel: GRPCChannel {
    return self.fakeChannel
  }

  public init(
    fakeChannel: FakeChannel = FakeChannel(),
    defaultCallOptions callOptions: CallOptions = CallOptions(),
    interceptors: Authentication_AuthenticationClientInterceptorFactoryProtocol? = nil
  ) {
    self.fakeChannel = fakeChannel
    self.defaultCallOptions = callOptions
    self.interceptors = interceptors
  }

  /// Make a unary response for the Authenticate RPC. This must be called
  /// before calling 'authenticate'. See also 'FakeUnaryResponse'.
  ///
  /// - Parameter requestHandler: a handler for request parts sent by the RPC.
  public func makeAuthenticateResponseStream(
    _ requestHandler: @escaping (FakeRequestPart<Authentication_AuthRequest>) -> () = { _ in }
  ) -> FakeUnaryResponse<Authentication_AuthRequest, Authentication_AuthResponse> {
    return self.fakeChannel.makeFakeUnaryResponse(path: Authentication_AuthenticationClientMetadata.Methods.authenticate.path, requestHandler: requestHandler)
  }

  public func enqueueAuthenticateResponse(
    _ response: Authentication_AuthResponse,
    _ requestHandler: @escaping (FakeRequestPart<Authentication_AuthRequest>) -> () = { _ in }
  ) {
    let stream = self.makeAuthenticateResponseStream(requestHandler)
    // This is the only operation on the stream; try! is fine.
    try! stream.sendMessage(response)
  }

  /// Returns true if there are response streams enqueued for 'Authenticate'
  public var hasAuthenticateResponsesRemaining: Bool {
    return self.fakeChannel.hasFakeResponseEnqueued(forPath: Authentication_AuthenticationClientMetadata.Methods.authenticate.path)
  }
}

