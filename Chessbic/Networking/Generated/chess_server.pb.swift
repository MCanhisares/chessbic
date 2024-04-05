// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: chess_server.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct ChessServer_MoveRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var matchID: String = String()

  public var pgnMove: String = String()

  public var playerColor: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct ChessServer_MoveResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var matchID: String = String()

  public var success: Bool = false

  public var boardState: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension ChessServer_MoveRequest: @unchecked Sendable {}
extension ChessServer_MoveResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "chess_server"

extension ChessServer_MoveRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MoveRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "match_id"),
    2: .standard(proto: "pgn_move"),
    3: .standard(proto: "player_color"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.matchID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.pgnMove) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.playerColor) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.matchID.isEmpty {
      try visitor.visitSingularStringField(value: self.matchID, fieldNumber: 1)
    }
    if !self.pgnMove.isEmpty {
      try visitor.visitSingularStringField(value: self.pgnMove, fieldNumber: 2)
    }
    if !self.playerColor.isEmpty {
      try visitor.visitSingularStringField(value: self.playerColor, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ChessServer_MoveRequest, rhs: ChessServer_MoveRequest) -> Bool {
    if lhs.matchID != rhs.matchID {return false}
    if lhs.pgnMove != rhs.pgnMove {return false}
    if lhs.playerColor != rhs.playerColor {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ChessServer_MoveResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MoveResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "match_id"),
    2: .same(proto: "success"),
    3: .standard(proto: "board_state"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.matchID) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.success) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.boardState) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.matchID.isEmpty {
      try visitor.visitSingularStringField(value: self.matchID, fieldNumber: 1)
    }
    if self.success != false {
      try visitor.visitSingularBoolField(value: self.success, fieldNumber: 2)
    }
    if !self.boardState.isEmpty {
      try visitor.visitSingularStringField(value: self.boardState, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ChessServer_MoveResponse, rhs: ChessServer_MoveResponse) -> Bool {
    if lhs.matchID != rhs.matchID {return false}
    if lhs.success != rhs.success {return false}
    if lhs.boardState != rhs.boardState {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
