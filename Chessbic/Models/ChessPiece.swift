//
//  ChessPiece.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-07.
//

import Foundation

enum Color: String {
    case White = "w"
    case Black = "b"
    
    func toImageName() -> String {
        switch self {
        case .Black:
            return "black"
        case .White:
            return "white"
        }
    }
}

enum PieceType {
    case Pawn
    case Knight
    case Bishop
    case Rook
    case Queen
    case King
    
    func toImageName () -> String {
        switch self {
        case .Pawn:
            return "pawn"
        case .Knight:
            return "knight"
        case .Bishop:
            return "bishop"
        case .Rook:
            return "rook"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        }
    }
}

struct ChessPiece {
    var color: Color
    var pieceType: PieceType
    
    init(color: Color, pieceType: PieceType) {
        self.color = color
        self.pieceType = pieceType
    }
    
    init?(char: Character) {
        if char.isLowercase {
            self.color = .Black
        } else {
            self.color = .White
        }
        switch char.lowercased() {
        case "p":
            self.pieceType = .Pawn
        case "n":
            self.pieceType = .Knight
        case "b":
            self.pieceType = .Bishop
        case "r":
            self.pieceType = .Rook
        case "q":
            self.pieceType = .Queen
        case "k":
            self.pieceType = .King
        default:
            return nil
        }
    }
    
    func toChar() -> Character {
        var char = ""
        switch self.pieceType {
        case .Pawn:
            char = "p"
        case .Knight:
            char = "n"
        case .Bishop:
            char = "b"
        case .Rook:
            char = "r"
        case .Queen:
            char = "q"
        case .King:
            char = "k"
        }
        return self.color == .White ? Character(char.uppercased()) : Character(char)
    }
    
    func toString() -> String {
        var char = ""
        switch self.pieceType {
        case .Pawn:
            char = "p"
        case .Knight:
            char = "n"
        case .Bishop:
            char = "b"
        case .Rook:
            char = "r"
        case .Queen:
            char = "q"
        case .King:
            char = "k"
        }
        return self.color == .White ? String(char.uppercased()) : char
    }
}

extension ChessPiece {
    func possibleMovesForPiece(square: Square) -> [Square]{
        switch self.pieceType {
        case .Bishop:
            return getBishopMoves(square: square)
        case .Rook:
            return getRookMoves(square: square)
        case .Knight:
            return getKnightMoves(square: square)
        case .Queen:
            return getQueenMoves(square: square)
        case .King:
            return getKingMoves(square: square)
        case .Pawn:
            return getPawnMoves(square: square)
        }
    }
    
    private func generateMoves(square: Square, moves: [(Int, Int)], increment: Bool = false) -> [Square] {
        var squares: [Square] = []
        for move in moves {
            var file = square.file + move.0
            var rank = square.rank + move.1
            while isValidSquare(file: file, rank: rank) {
                squares.append(Square(file: file, rank: rank))
                if increment {
                    file += move.0
                    rank += move.1
                } else {
                    break
                }
            }
        }
        return squares
    }
    
    private func isValidSquare(file: Int, rank: Int) -> Bool {
        return !(file < 0 || rank < 0 || file >= BOARD_SIZE || rank >= BOARD_SIZE)
    }
    
    private func getPawnMoves(square: Square) -> [Square] {
        var moves: [Square] = []
        if self.color == .White {
            // Move one square forward
            if square.rank < 7 {
                moves.append(Square(file: square.file, rank: square.rank + 1))
            }
            if square.rank == 1 {
                moves.append(Square(file: square.file, rank: square.rank + 2))
            }
            if square.file > 0 {
                moves.append(Square(file: square.file - 1, rank: square.rank + 1))
            }
            if square.file < 7 {
                moves.append(Square(file: square.file + 1, rank: square.rank + 1))
            }
        }
        else {
            if square.rank > 0 {
                moves.append(Square(file: square.file, rank: square.rank - 1))
            }
            if square.rank == 6 {
                moves.append(Square(file: square.file, rank: square.rank - 2))
            }
            if square.file > 0 {
                moves.append(Square(file: square.file - 1, rank: square.rank - 1))
            }
            if square.file < 7 {
                moves.append(Square(file: square.file + 1, rank: square.rank - 1))
            }
        }
        return moves
    }
    
    private func getQueenMoves(square: Square) -> [Square] {
        let queen_moves = [(1, 1), (-1, -1), (-1, 1), (1, -1), (1, 0), (-1, 0), (0, 1), (0, -1)]
        return self.generateMoves(square: square, moves: queen_moves, increment: true)
    }
    
    private func getKingMoves(square: Square) -> [Square] {
        let moves = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (-1, -1), (-1, 1), (1, -1)]
        return self.generateMoves(square: square, moves: moves, increment: false)
    }
    
    private func getKnightMoves(square: Square) -> [Square] {
        let moves = [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (-1, 2), (1, -2), (-1, -2)]
        return self.generateMoves(square: square, moves: moves, increment: false)
    }
    
    private func getRookMoves(square: Square) -> [Square] {
        let rook_moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        return self.generateMoves(square: square, moves: rook_moves, increment: true)
    }
    
    private func getBishopMoves(square: Square) -> [Square] {
        let bishop_moves = [(1, 1), (-1, -1), (-1, 1), (1, -1)]
        return self.generateMoves(square: square, moves: bishop_moves, increment: true)
    }
}
