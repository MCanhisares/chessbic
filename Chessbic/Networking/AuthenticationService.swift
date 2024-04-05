//
//  AuthService.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2024-04-05.
//

import Foundation
import NIO
import GRPC

struct Auth: Codable {
    let accessToken: String
    let refreshToken: String
}

protocol AuthenticationProvider {
    func freshAuthToken() -> EventLoopFuture<String>
}

final class AuthenticationService: AuthenticationProvider {
    let eventLoopProvider: EventLoopProvider
    let ACCOUNT = "Chessbic"
    let SERVICE = "Token"
    
    init(eventLoopProvider: EventLoopProvider) {
        self.eventLoopProvider = eventLoopProvider
    }
    
    func authenticate() -> Bool {
        // Create an object to save
        let auth = Auth(accessToken: "dummy-access-token",
                        refreshToken: "dummy-refresh-token")
        // Save `auth` to keychain
        KeychainHelper.standard.save(auth, service: self.SERVICE, account: self.ACCOUNT)
        
        // Read `auth` from keychain
        let result = KeychainHelper.standard.read(service: self.SERVICE, account: self.ACCOUNT, type: Auth.self)
        return result != nil
    }
    
    func isAuthenticated () -> Bool {
        return KeychainHelper.standard.read(service: self.SERVICE, account: self.ACCOUNT, type: Auth.self) != nil
    }
    
    func freshAuthToken() -> EventLoopFuture<String> {
        let promise: EventLoopPromise<String> = eventLoopProvider.eventLoop.makePromise()
        
        // Succeed the promise with a valid access token, refreshing it if necessary
        promise.succeed("<a-valid-access-token>")
        
        // Or fail the promise if an access token is not possible to obtain
        // promise.fail(SomeError)
        
        return promise.futureResult
    }
}
