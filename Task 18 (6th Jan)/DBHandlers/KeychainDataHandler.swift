//
//  KeychainDataHandler.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 9/1/23.
//

import Foundation


class KeychainDataHandler {
    static func writeToKeychain(account: String, service: String, pass: String) {
        
        let account = account
        let service = service
        
        guard let data = try? JSONEncoder().encode(pass) else {
            return
        }
        
        let query = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecValueData: data
        ] as CFDictionary
        
        SecItemAdd(query, nil)
    }
    
    
    static func readFromKeyChain(account: String, service: String) ->  String? {
        
        let query = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecReturnData: true,
            kSecReturnAttributes: true
        ] as CFDictionary
        
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query, &result)
        
        if status == errSecSuccess {
            if let result = result as? [CFString : Any] {
                //                print(result[kSecValueData])
                //                print(result[kSecAttrAccount])
                //                print(result[kSecAttrService])
                
                if let data = result[kSecValueData] as? Data {
                    let password = try? JSONDecoder().decode(String.self, from: data)
                    print(password)
                    return password
                }
            }
        } else {
            print(status)
            return nil
        }
        return nil
    }
}
