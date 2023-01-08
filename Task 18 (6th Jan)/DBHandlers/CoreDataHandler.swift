//
//  CoreDataHandler.swift
//  Task 18 (6th Jan)
//
//  Created by Moh. Absar Rahman on 8/1/23.
//

import UIKit
import CoreData

class CoreDataHandler: DBHandlerProtocol {
    
    static let shared = CoreDataHandler()
    
    static private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static var coreDataContext: NSManagedObjectContext {
        get {
            context
        }
    }
    
    private init(){}
    
    func addData<T>(data: T) {
        
        assert(T.self is NSManagedObject.Type,"The object cannot be added in core data")
        do {
            try CoreDataHandler.context.save()
        } catch {
            print("Error occured while adding data")
        }
    }
    
    func removeData<T>(data: T) {
        //
        assert(T.self is NSManagedObject.Type,"The object cannot be added in core data")
        CoreDataHandler.context.delete(data as! NSManagedObject)
        do {
            try CoreDataHandler.context.save()
        } catch {
            print("Error occurred while deleting \(error)")
        }
        
    }
    
    func updateData<T>(data: T) {
        //
    }
    
    internal func fetchData<T>(data: T) -> T {
        // TODO: NEED TO DO SOMETHING ABOUT THIS FUNCTION
        //let dataModels = []
//        do {
//            dataModels = try context.fetch(da)
//        }
        return data
    }
    
    func fetchDataFromCoreData<T>(dataFetchRequest: NSFetchRequest<T>) -> [T] {
        var dataModel: [T] = []
        do {
            dataModel = try CoreDataHandler.context.fetch(dataFetchRequest)
        } catch {
            print("Error occurred while fetching \(error)")
        }
        return dataModel
    }
}
