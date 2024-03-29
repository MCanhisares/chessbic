//
//  ChessPieceTests.swift
//  ChessbicTests
//
//  Created by Marcel Canhisares on 2023-09-07.
//

import XCTest
@testable import Chessbic
final class ChessPieceTests: XCTestCase {


    func testRookMoves() {
        let chessPiece = ChessPiece(color: .White, pieceType: .Rook)
        let validRookMoves = [
            Square(file: 0, rank: 0),Square(file: 0, rank: 0),
            Square(file: 1, rank: 0),Square(file: 0, rank: 1),
            Square(file: 2, rank: 0),Square(file: 0, rank: 2),
            Square(file: 3, rank: 0),Square(file: 0, rank: 3),
            Square(file: 4, rank: 0),Square(file: 0, rank: 4),
            Square(file: 5, rank: 0),Square(file: 0, rank: 5),
            Square(file: 6, rank: 0),Square(file: 0, rank: 6),
            Square(file: 7, rank: 0),Square(file: 0, rank: 7)]
        let candidateRookMoves = chessPiece.possibleMovesForPiece(square: Square(file: 0, rank: 0))
        XCTAssertEqual(validRookMoves, candidateRookMoves)
    }
    
    func testBishopMoves() {
        let chessPiece = ChessPiece(color: .White, pieceType: .Bishop)
        let validBishopMoves = [
            Square(file: 0, rank: 0),Square(file: 1, rank: 1),
            Square(file: 2, rank: 2),Square(file: 3, rank: 3),
            Square(file: 4, rank: 4),Square(file: 5, rank: 5),
            Square(file: 6, rank: 6),Square(file: 7, rank: 7),
            Square(file: 0, rank: 0),Square(file: 0, rank: 0),
            Square(file: 0, rank: 0)]
        let candidateBishopMoves = chessPiece.possibleMovesForPiece(square: Square(file: 0, rank: 0))
        XCTAssertEqual(validBishopMoves, candidateBishopMoves)
    }
    
    func testKnightMoves() {
        let chessPiece = ChessPiece(color: .White, pieceType: .Knight)
        let validKnightMoves = [
            Square(file: 1, rank: 2),Square(file: 2, rank: 1)]
        let candidateKnightMoves = chessPiece.possibleMovesForPiece(square: Square(file: 0, rank: 0))
        XCTAssertEqual(validKnightMoves, candidateKnightMoves)
    }
    
    func testPawnMoves() {
        let chessPiece = ChessPiece(color: .White, pieceType: .Pawn)
        let validPawnMoves = [Square(file: 0, rank: 1)]
        let candidatePawnMoves = chessPiece.possibleMovesForPiece(square: Square(file: 0, rank: 0))
        XCTAssertEqual(validPawnMoves, candidatePawnMoves)
    }
    
    func testKingMoves() {
        let chessPiece = ChessPiece(color: .White, pieceType: .King)
        let validKingMoves = [
            Square(file: 0, rank: 1),
            Square(file: 1, rank: 0),Square(file: 1, rank: 1)]
        let candidateKingMoves = chessPiece.possibleMovesForPiece(square: Square(file: 0, rank: 0))
        XCTAssertEqual(validKingMoves, candidateKingMoves)
    }
    
    func testQueenMoves() {
        let chessPiece = ChessPiece(color: .White, pieceType: .Queen)
        let validQueenMoves = [
            Square(file: 0, rank: 0),Square(file: 1, rank: 1),
            Square(file: 2, rank: 2),Square(file: 3, rank: 3),
            Square(file: 4, rank: 4),Square(file: 5, rank: 5),
            Square(file: 6, rank: 6),Square(file: 7, rank: 7),
            Square(file: 0, rank: 0),Square(file: 0, rank: 0),
            Square(file: 0, rank: 0),
            Square(file: 0, rank: 0),Square(file: 0, rank: 0),
            Square(file: 1, rank: 0),Square(file: 0, rank: 1),
            Square(file: 2, rank: 0),Square(file: 0, rank: 2),
            Square(file: 3, rank: 0),Square(file: 0, rank: 3),
            Square(file: 4, rank: 0),Square(file: 0, rank: 4),
            Square(file: 5, rank: 0),Square(file: 0, rank: 5),
            Square(file: 6, rank: 0),Square(file: 0, rank: 6),
            Square(file: 7, rank: 0),Square(file: 0, rank: 7),
            ]
        let candidateQueenMoves = chessPiece.possibleMovesForPiece(square: Square(file: 0, rank: 0))
        XCTAssertEqual(validQueenMoves, candidateQueenMoves)
    }
}
