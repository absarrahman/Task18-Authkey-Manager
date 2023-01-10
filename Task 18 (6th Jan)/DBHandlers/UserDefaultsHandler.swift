//
//  UserDefaultsHandler.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 10/1/23.
//

import UIKit

class UserDefaultsHandler {
    static func fetchBoolData(for key: String) -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }
    
    static func fetchIntData(for key: String) -> Int {
        UserDefaults.standard.integer(forKey: key)
    }
    
    static func fetchDoubleData(for key: String) -> Double {
        UserDefaults.standard.double(forKey: key)
    }
    
    static func fetchObjectData(for key: String) -> Any? {
        UserDefaults.standard.object(forKey: key)
    }
    
    static func fetchStringData(for key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    static func setDefaultData(for key: String, with value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
    
}
