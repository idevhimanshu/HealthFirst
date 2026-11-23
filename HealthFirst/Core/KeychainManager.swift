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
    
   
    
     func saveAccessToken(token: String){
        keychain.set(token, forKey: "access_token")
    }
    
    func saveRefreshToken(token: String){
       keychain.set(token, forKey: "refresh_token")
   }
    
    func hasToken() -> Bool {
        if let token = getAccessToken(), !token.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func getAccessToken() -> String? {
        keychain.get("access_token")
    }
    
    func getRefreshToken() -> String? {
        keychain.get("refresh_token")
    }
    
    
    func deleteAll() {
        keychain.clear()
    }
}
