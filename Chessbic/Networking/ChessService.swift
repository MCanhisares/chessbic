//
//  ChessService.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2024-04-05.
//

import Foundation
import NIO
import GRPC


final class ChessService {
    let rpcClient: ChessServer_MatchClientProtocol
    
    init() {
        self.rpcClient = DefaultClientFactory.shared.ChessServiceClient()
    }
    
    func makeMove( pgnMove: String , completion: @escaping (Result<ChessServer_MoveResponse, Error>) -> Void) {
        let moveRequest = ChessServer_MoveRequest.with {
            $0.matchID = "1"
            $0.pgnMove = pgnMove
            $0.playerColor = "w"
        }
        rpcClient.movePiece(moveRequest, callOptions: nil).response
            .whenComplete { result in
                switch result {
                case let .failure(error):
                    completion(.failure(error))
                case let .success(response):
                    completion(.success((response)))
                }
            }
    }
}
