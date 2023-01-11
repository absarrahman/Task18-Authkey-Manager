//
//  CodeTypeModel+CoreDataProperties.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 11/1/23.
//
//

import Foundation
import CoreData


extension CodeTypeModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CodeTypeModel> {
        return NSFetchRequest<CodeTypeModel>(entityName: "CodeTypeModel")
    }

    @NSManaged public var typeName: String?
    @NSManaged public var authModels: NSSet?

}

// MARK: Generated accessors for authModels
extension CodeTypeModel {

    @objc(addAuthModelsObject:)
    @NSManaged public func addToAuthModels(_ value: AuthModel)

    @objc(removeAuthModelsObject:)
    @NSManaged public func removeFromAuthModels(_ value: AuthModel)

    @objc(addAuthModels:)
    @NSManaged public func addToAuthModels(_ values: NSSet)

    @objc(removeAuthModels:)
    @NSManaged public func removeFromAuthModels(_ values: NSSet)

}

extension CodeTypeModel : Identifiable {

}
