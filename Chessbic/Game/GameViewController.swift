//
//  ViewController.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-06.
//

import UIKit

class GameViewController: UIViewController {
    let chessBoard: [[ChessPiece]] = [
        [.Rook, .Knight, .Bishop, .King, .Queen, .Bishop, .Knight, .Rook],
        [.Pawn,.Pawn,.Pawn,.Pawn,.Pawn,.Pawn,.Pawn,.Pawn],
        [.None,.None,.None,.None,.None,.None,.None,.None],
        [.None,.None,.None,.None,.None,.None,.None,.None],
        [.None,.None,.None,.None,.None,.None,.None,.None],
        [.None,.None,.None,.None,.None,.None,.None,.None],
        [.Pawn,.Pawn,.Pawn,.Pawn,.Pawn,.Pawn,.Pawn,.Pawn],
        [.Rook, .Knight, .Bishop, .King, .Queen, .Bishop, .Knight, .Rook]]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        cv.register(ChessboardCell.self, forCellWithReuseIdentifier: ChessboardCell.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        view.addSubview(collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    
}

extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return chessBoard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        chessBoard[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ChessboardCell else {
            return
        }
        let pathsToHighlight = cell.piece.possibleMovesForPiece(square: Coordinate(from: indexPath))
        guard let selectedpaths = collectionView.indexPathsForSelectedItems else {
            return
        }
        
        for p in selectedpaths {
            collectionView.deselectItem(at: p, animated: false)
        }
        for p in pathsToHighlight{
            collectionView.selectItem(at: p.toIndexPath(), animated: false, scrollPosition: .centeredVertically)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChessboardCell.identifier, for: indexPath) as? ChessboardCell else {
            return UICollectionViewCell()
        }
        cell.configureWith(model: ChessboardCellModel(piece: self.chessBoard[indexPath.section][indexPath.row]), indexPath: indexPath)
        
        return cell
    }
    
}


extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 8, height: collectionView.bounds.height / 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
