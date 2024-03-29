//
//  ViewController.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-06.
//

import UIKit

class GameViewController: UIViewController {
    let chessBoard: [ChessPiece?] = [
        ChessPiece(color: .Black, pieceType: .Rook), ChessPiece(color: .Black, pieceType: .Knight),ChessPiece(color: .Black, pieceType: .Bishop),ChessPiece(color: .Black, pieceType: .Queen),ChessPiece(color: .Black, pieceType: .King),ChessPiece(color: .Black, pieceType: .Bishop),ChessPiece(color: .Black, pieceType: .Knight), ChessPiece(color: .Black, pieceType: .Rook),
        ChessPiece(color: .Black, pieceType: .Pawn), ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn),ChessPiece(color: .Black, pieceType: .Pawn), ChessPiece(color: .Black, pieceType: .Pawn),
        nil, nil, nil, nil, nil, nil, nil, nil,
        nil, nil, nil, nil, nil, nil, nil, nil,
        nil, nil, nil, nil, nil, nil, nil, nil,
        nil, nil, nil, nil, nil, nil, nil, nil,
        ChessPiece(color: .White, pieceType: .Pawn), ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn),ChessPiece(color: .White, pieceType: .Pawn), ChessPiece(color: .White, pieceType: .Pawn),
        ChessPiece(color: .White, pieceType: .Rook), ChessPiece(color: .White, pieceType: .Knight),ChessPiece(color: .White, pieceType: .Bishop),ChessPiece(color: .White, pieceType: .Queen),ChessPiece(color: .White, pieceType: .King),ChessPiece(color: .White, pieceType: .Bishop),ChessPiece(color: .White, pieceType: .Knight), ChessPiece(color: .White, pieceType: .Rook)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        
        
        
    }
    
    
}

