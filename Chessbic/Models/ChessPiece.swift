//
//  ChessPiece.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-07.
//

import Foundation

enum ChessPiece: String {
    case Pawn = "P"
    case Knight = "C"
    case Bishop = "B"
    case Rook = "R"
    case Queen = "Q"
    case King = "K"
    case None = ""
}

extension ChessPiece {
    func possibleMovesForPiece(square: Coordinate) -> [Coordinate]{
        switch self {
        case .Bishop:
            return getBishopMoves(square: square)
        case .Rook:
            return getRookMoves(square: square)
        case .Knight:
            return getKnightMoves(square: square)
        case .Queen:
            return getBishopMoves(square: square) + getRookMoves(square: square)
        case .King:
            return getKingMoves(square: square)
        case .Pawn:
            return getPawnMoves(square: square)
        case .None:
            return []
        }
    }
    
    private func isValidSquare(x: Int, y: Int) -> Bool {
        return !(x < 0 || y < 0 || x >= BOARD_SIZE || y >= BOARD_SIZE)
    }
    
    private func getPawnMoves(square: Coordinate) -> [Coordinate] {
        return [Coordinate(x: square.x, y: square.y + 1)]
    }
    
    private func getKingMoves(square: Coordinate) -> [Coordinate] {
        var coordinates: [Coordinate] = []
        let moves = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (-1, -1), (-1, 1), (1, -1)]
        for move in moves {
            if isValidSquare(x: square.x + move.0, y: square.y + move.1) {
                coordinates.append(Coordinate(x: square.x + move.0, y: square.y + move.1))
            }
        }
        return coordinates
    }
    
    private func getKnightMoves(square: Coordinate) -> [Coordinate] {
        var coordinates: [Coordinate] = []
        let moves = [(-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2)]
        for move in moves {
            if isValidSquare(x: square.x + move.0, y: square.y + move.1) {
                coordinates.append(Coordinate(x: square.x + move.0, y: square.y + move.1))
            }
        }
        return coordinates
    }
    
    private func getRookMoves(square: Coordinate) -> [Coordinate] {
        var coordinates: [Coordinate] = []
        for i in 0..<BOARD_SIZE {
            coordinates.append(Coordinate(x: i, y: square.y))
            coordinates.append(Coordinate(x: square.x, y: i))
        }
        return coordinates
    }
    
    private func getBishopMoves(square: Coordinate) -> [Coordinate] {
        var coordinates: [Coordinate] = []
        //Bottom right diag
        var i = square.x
        var j = square.y
        
        while i < BOARD_SIZE && j < BOARD_SIZE {
            coordinates.append(Coordinate(x: i, y: j))
            i += 1
            j += 1
        }
        //Bottom left diag
        i = square.x
        j = square.y
        
        while i < BOARD_SIZE && j >= 0 {
            coordinates.append(Coordinate(x: i, y: j))
            i += 1
            j -= 1
        }
        //Top right diag
        i = square.x
        j = square.y
        
        while i >= 0 && j < BOARD_SIZE {
            coordinates.append(Coordinate(x: i, y: j))
            i -= 1
            j += 1
        }
        //Top left diag
        i = square.x
        j = square.y
        
        while i >= 0 && j >= 0 {
            coordinates.append(Coordinate(x: i, y: j))
            i -= 1
            j -= 1
        }
        return coordinates
    }
}


