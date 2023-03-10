//
//  Constants.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 9/1/23.
//

import Foundation

class Constants {
    private init(){}
    class UserDefaultKeys {
        private init(){}
        static let themeKey = "themeKey"
        static let loggedInKey = "loggedInKey"
    }
    class RoutesConstants {
        private init(){}
        static let goToAuthKeys = "goToAuthKeys"
        static let goToLoginSession =  "goToLoginSession"
        static let goToAddVC = "goToAddVC"
    }
    class DBEntityConstants {
        static let authEntityName = "AuthModel"
        static let codeTypeEntityName = "CodeTypeModel"
    }
}
