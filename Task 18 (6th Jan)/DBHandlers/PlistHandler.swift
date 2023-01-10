//
//  PlistHandler.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 10/1/23.
//

import Foundation

class PlistHandler {
    
    static func writeToPlist(with dict: [String : Any]) {
        
        guard let documentDirURL = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first?.appending(path: "login.plist") else {
            return
        }

        do {
            let data = try PropertyListSerialization.data(fromPropertyList: dict, format: .xml, options: 0)
            try data.write(to: documentDirURL)
        } catch {
            print(error)
        }
    }
    
    
    static func readFromPlist() -> [String : Any]? {
        
        guard let documentDirURL = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first?.appending(path: "login.plist") else {
            return nil
        }
        
//        guard let data = try? Data(contentsOf: filePath) else { return nil }
        do {
            let data = try Data(contentsOf: documentDirURL)
            let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String : Any]
            return plistData
        } catch {
            print("ERRROR OCCURRRED \(error)")
            return nil
        }
        
    }
}
