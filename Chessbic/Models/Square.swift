//
//  Square.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-07.
//

import Foundation

let BOARD_SIZE = 8
let ASCII_a = 97

struct Square {
    var file: Int
    var rank: Int
    
    init(file: Int, rank: Int) {
        self.file = file
        self.rank = rank
    }
    
    init(fromIndex arrIndex: Int) {
        self.file = arrIndex % BOARD_SIZE
        self.rank = (BOARD_SIZE - 1) - (arrIndex / BOARD_SIZE)
    }
    
    init?(pgn: String) {
        guard pgn.count == 2 else {
            return nil
        }
        switch pgn[pgn.startIndex] {
        case "a":
            self.file = 0
        case "b":
            self.file = 1
        case "c":
            self.file = 2
        case "d":
            self.file = 3
        case "e":
            self.file = 4
        case "f":
            self.file = 5
        case "g":
            self.file = 6
        case "h":
            self.file = 7
        default:
            return nil
        }
        
        switch pgn[pgn.index(after: pgn.startIndex)] {
        case "1":
            self.rank = 0
        case "2":
            self.rank = 1
        case "3":
            self.rank = 2
        case "4":
            self.rank = 3
        case "5":
            self.rank = 4
        case "6":
            self.rank = 5
        case "7":
            self.rank = 6
        case "8":
            self.rank = 7
        default:
            return nil
        }
    }
    
    func toArrIndex() -> Int {
        return (BOARD_SIZE - 1 - self.rank) * BOARD_SIZE + self.file
    }
    
    func isValid() -> Bool {
        return !(self.file < 0 || self.rank < 0 || self.file >= BOARD_SIZE || self.rank >= BOARD_SIZE)
    }
    
    func toPGN() -> String {
        guard self.isValid() else {
            return ""
        }
        return "\(UnicodeScalar(self.file + ASCII_a)!)\(self.rank)"
    }
}

extension Square: Equatable {
    static func ==(lhs: Square, rhs: Square) -> Bool {
        return lhs.file == rhs.file && lhs.rank == rhs.rank
    }
}
