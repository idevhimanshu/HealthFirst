//
//  KeychainManager.swift
//  HealthFirst
//
//  Created by Himanshu on 17/11/26.
//

import Foundation
import KeychainSwift

class KeychainManager {
    
    static let shared = KeychainManager()
    
    private let keychain = KeychainSwift()
    private init() {
        
    }
    
     func savetoken(token: String){
        keychain.set(token, forKey: "token")
    }
    
    func getToken() -> String? {
        keychain.get("token")
    }
    
    func deleteToken() {
        keychain.delete("token")
    }
    
    func deleteAll() {
        keychain.clear()
    }
}
