//
//  ChessboardCell.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-07.
//

import Foundation
import UIKit
import Observation

enum ChessPiece: String {
    case Pawn = "P"
    case Knight = "C"
    case Bishop = "B"
    case Rook = "R"
    case Queen = "Q"
    case King = "K"
    case None = ""
}


@Observable struct ChessboardCellModel {
    let piece: ChessPiece
}

class ChessboardCell: UICollectionViewCell {
    static let identifier = "ChessboardCell"
    private var piece: ChessPiece = .Knight
    private var label: UILabel
    private var container: UIView
    
    required init?(coder: NSCoder) {
        fatalError("Coder not implemented")
    }
    
    override init(frame: CGRect) {
        self.label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        self.container = UIView()
        super.init(frame: frame)
        
        container.backgroundColor = .red
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.black.cgColor
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        container.addSubview(label)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
    }
    func track() {
        withObservationTracking {
            let _  = self.piece
        } onChange: {
            Task { @MainActor [weak self] in
                self?.label.text = self?.piece.rawValue
            }
        }
        
    }
    
    func configureWith(model: ChessboardCellModel, indexPath: IndexPath) {
        let position = indexPath.section + indexPath.item
        self.container.backgroundColor = position % 2 == 0 ? .white : .gray
        self.piece = model.piece
        self.label.text = model.piece.rawValue
    }
}
