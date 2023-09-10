//
//  Auth.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-09.
//

import Foundation

struct Auth: Codable {
    let accessToken: String
    let refreshToken: String
}

struct AuthenticationService {
    let ACCOUNT = "Chessbic"
    let SERVICE = "Token"
    
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
}
