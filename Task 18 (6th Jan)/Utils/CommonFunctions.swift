//
//  CommonFunctions.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 10/1/23.
//

import Foundation

class CommonFunctions {
    
    
    private static let fileManager = FileManager.default
    
    static func doesPathExists(for path: String) -> Bool {
        guard let documentDirURL = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else {
            return false
        }
        
        let folderURL = documentDirURL.appendingPathComponent(path)
        return fileManager.fileExists(atPath: folderURL.path)
    }
    
    static func createFile(to folderPath: String, fileName: String, fileExtension: String, for data: Data) -> String? {
        
        guard let documentDirURL = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else {
            return nil
        }
        
        let folderURL = documentDirURL.appendingPathComponent(folderPath)
        
        do {
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
            print(documentDirURL.path)
        } catch {
            print(error)
            return nil
        }
        
        let fileURL = folderURL.appendingPathComponent("\(fileName).\(fileExtension)")
        print(fileURL)
        
        fileManager.createFile(atPath: fileURL.path , contents: data)
        
        // need the url path
        return fileURL.path
    }
    
    static func fetchData(from filePath: String) -> Data? {
        
        
        guard let documentDirURL = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else {
            return nil
        }
        
        let fileURL = documentDirURL.appendingPathComponent(filePath)
        
        do {
            // reading the file contents as Data
            let readData = try Data(contentsOf: fileURL)
            return readData
        } catch {
            print(error)
            return nil
        }
    }
    
    
    static func decodeJsonToObject<T>(_ type: T.Type, jsonString:String) -> T?  where T : Decodable {
        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        do {
            let object = try JSONDecoder().decode(type, from: jsonData)
            return object
        } catch {
            print(error)
            return nil
        }
    }
    
    static func encodeJson<T>(from object: T) -> String? where T : Encodable {
        do {
            let jsonData = try JSONEncoder().encode(object)
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getCurrentTime() -> (String, String) {
        let mytime = Date()
        let dateFormat = DateFormatter()
        let timeFormat = DateFormatter()
        dateFormat.dateFormat = "dd.MM.yyyy"
        timeFormat.dateFormat = "h:mm a"
        
        return (timeFormat.string(from: mytime), dateFormat.string(from: mytime))
    }
    
}
