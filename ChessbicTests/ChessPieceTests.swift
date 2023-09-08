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
        let chessPiece = ChessPiece.Rook
        let validRookMoves = [
            Coordinate(x: 0, y: 0),Coordinate(x: 0, y: 0),
            Coordinate(x: 1, y: 0),Coordinate(x: 0, y: 1),
            Coordinate(x: 2, y: 0),Coordinate(x: 0, y: 2),
            Coordinate(x: 3, y: 0),Coordinate(x: 0, y: 3),
            Coordinate(x: 4, y: 0),Coordinate(x: 0, y: 4),
            Coordinate(x: 5, y: 0),Coordinate(x: 0, y: 5),
            Coordinate(x: 6, y: 0),Coordinate(x: 0, y: 6),
            Coordinate(x: 7, y: 0),Coordinate(x: 0, y: 7)]
        let candidateRookMoves = chessPiece.possibleMovesForPiece(square: Coordinate(x: 0, y: 0))
        XCTAssertEqual(validRookMoves, candidateRookMoves)
    }
    
    func testBishopMoves() {
        let chessPiece = ChessPiece.Bishop
        let validBishopMoves = [
            Coordinate(x: 0, y: 0),Coordinate(x: 1, y: 1),
            Coordinate(x: 2, y: 2),Coordinate(x: 3, y: 3),
            Coordinate(x: 4, y: 4),Coordinate(x: 5, y: 5),
            Coordinate(x: 6, y: 6),Coordinate(x: 7, y: 7),
            Coordinate(x: 0, y: 0),Coordinate(x: 0, y: 0),
            Coordinate(x: 0, y: 0)]
        let candidateBishopMoves = chessPiece.possibleMovesForPiece(square: Coordinate(x: 0, y: 0))
        XCTAssertEqual(validBishopMoves, candidateBishopMoves)
    }
    
    func testKnightMoves() {
        let chessPiece = ChessPiece.Knight
        let validKnightMoves = [
            Coordinate(x: 1, y: 2),Coordinate(x: 2, y: 1)]
        let candidateKnightMoves = chessPiece.possibleMovesForPiece(square: Coordinate(x: 0, y: 0))
        XCTAssertEqual(validKnightMoves, candidateKnightMoves)
    }
    
    func testPawnMoves() {
        let chessPiece = ChessPiece.Pawn
        let validPawnMoves = [Coordinate(x: 0, y: 1)]
        let candidatePawnMoves = chessPiece.possibleMovesForPiece(square: Coordinate(x: 0, y: 0))
        XCTAssertEqual(validPawnMoves, candidatePawnMoves)
    }
    
    func testKingMoves() {
        let chessPiece = ChessPiece.King
        let validKingMoves = [
            Coordinate(x: 0, y: 1),
            Coordinate(x: 1, y: 0),Coordinate(x: 1, y: 1)]
        let candidateKingMoves = chessPiece.possibleMovesForPiece(square: Coordinate(x: 0, y: 0))
        XCTAssertEqual(validKingMoves, candidateKingMoves)
    }
    
    func testQueenMoves() {
        let chessPiece = ChessPiece.Queen
        let validQueenMoves = [
            Coordinate(x: 0, y: 0),Coordinate(x: 1, y: 1),
            Coordinate(x: 2, y: 2),Coordinate(x: 3, y: 3),
            Coordinate(x: 4, y: 4),Coordinate(x: 5, y: 5),
            Coordinate(x: 6, y: 6),Coordinate(x: 7, y: 7),
            Coordinate(x: 0, y: 0),Coordinate(x: 0, y: 0),
            Coordinate(x: 0, y: 0),
            Coordinate(x: 0, y: 0),Coordinate(x: 0, y: 0),
            Coordinate(x: 1, y: 0),Coordinate(x: 0, y: 1),
            Coordinate(x: 2, y: 0),Coordinate(x: 0, y: 2),
            Coordinate(x: 3, y: 0),Coordinate(x: 0, y: 3),
            Coordinate(x: 4, y: 0),Coordinate(x: 0, y: 4),
            Coordinate(x: 5, y: 0),Coordinate(x: 0, y: 5),
            Coordinate(x: 6, y: 0),Coordinate(x: 0, y: 6),
            Coordinate(x: 7, y: 0),Coordinate(x: 0, y: 7),
            ]
        let candidateQueenMoves = chessPiece.possibleMovesForPiece(square: Coordinate(x: 0, y: 0))
        XCTAssertEqual(validQueenMoves, candidateQueenMoves)
    }
}
