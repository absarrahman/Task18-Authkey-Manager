//
//  AuthModel+CoreDataProperties.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 11/1/23.
//
//

import Foundation
import CoreData


extension AuthModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AuthModel> {
        return NSFetchRequest<AuthModel>(entityName: "AuthModel")
    }

    @NSManaged public var code: String?
    @NSManaged public var title: String?
    @NSManaged public var codeType: CodeTypeModel?

}

extension AuthModel : Identifiable {
    static var authModelList:[AuthModel] = []
}
