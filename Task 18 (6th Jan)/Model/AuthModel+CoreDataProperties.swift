//
//  AuthModel+CoreDataProperties.swift
//  Task 18 (6th Jan)
//
//  Created by Moh. Absar Rahman on 8/1/23.
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

}

extension AuthModel : Identifiable {

}
