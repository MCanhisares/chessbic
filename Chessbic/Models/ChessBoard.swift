//
//  ChessBoard.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2024-03-29.
//

import Foundation

struct Board: Equatable {
    static func == (lhs: Board, rhs: Board) -> Bool {
        return true
    }
    
    private(set) var pieces: [ChessPiece?]
}

extension Board {
    static let allPositions = (0 ..< BOARD_SIZE*BOARD_SIZE).map { Square(fromIndex: $0) }

    var allSquares: [Square] { return Self.allPositions }

    var allPieces: [(square: Square, piece: ChessPiece?)] {
        return allSquares.map { ($0, pieces[$0.toArrIndex()]) }
    }

    init() {
        pieces = [
            ChessPiece(color: .Black, pieceType: .Rook), ChessPiece(color: .Black, pieceType: .Knight),ChessPiece(color: .Black, pieceType: .Bishop),ChessPiece(color: .Black, pieceType: .Queen),ChessPiece(color: .Black, pieceType: .King),ChessPiece(color: .Black, pieceType: .Bishop),ChessPiece(color: .Black, pieceType: .Knight), ChessPiece(color: .Black, pieceType: .Rook),
            ChessPiece(color: .Black, pieceType: .Pawn), ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn), ChessPiece(color: .Black, pieceType: .Pawn),
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            ChessPiece(color: .White, pieceType: .Pawn), ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn), ChessPiece(color: .White, pieceType: .Pawn),
            ChessPiece(color: .White, pieceType: .Rook), ChessPiece(color: .White, pieceType: .Knight),ChessPiece(color: .White, pieceType: .Bishop),ChessPiece(color: .White, pieceType: .Queen),ChessPiece(color: .White, pieceType: .King),ChessPiece(color: .White, pieceType: .Bishop),ChessPiece(color: .White, pieceType: .Knight), ChessPiece(color: .White, pieceType: .Rook)
        ]
    }

    func piece(at square: Square) -> ChessPiece? {
        return pieces[square.toArrIndex()]
    }

    func firstPosition(where condition: (ChessPiece) -> Bool) -> Square? {
        return allPieces.first(where: { tuple in
            guard let piece = tuple.piece else {
                return false
            }
            return condition(piece)
        })?.square
    }

    mutating func movePiece(from: Square, to: Square) {
        var pieces = self.pieces
        pieces[to.toArrIndex()] = piece(at: from)
        pieces[from.toArrIndex()] = nil
        self.pieces = pieces
    }

    mutating func removePiece(at square: Square) {
        var pieces = self.pieces
        pieces[square.toArrIndex()] = nil
        self.pieces = pieces
    }

    mutating func promotePiece(at square: Square, to type: PieceType) {
        var piece = piece(at: square)
        piece?.pieceType = type
        pieces[square.toArrIndex()] = piece
    }
}
