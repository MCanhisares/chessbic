//
//  Coordinate.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-07.
//

import Foundation

let BOARD_SIZE = 8
let ASCII_a = 97

struct Coordinate {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(from indexPath: IndexPath) {
        self.x = indexPath.section
        self.y = indexPath.row
    }
    
    func toIndexPath() -> IndexPath {
        return IndexPath(row: self.x, section: self.y)
    }
    
    func isValid() -> Bool {
        return !(self.x < 0 || self.y < 0 || self.x >= BOARD_SIZE || self.y >= BOARD_SIZE)
    }
    
    func toPGN() -> String {
        guard self.isValid() else {
            return ""
        }
        return "\(UnicodeScalar(self.x + ASCII_a)!)\(self.y)"
    }
}

extension Coordinate: Equatable {
    static func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
