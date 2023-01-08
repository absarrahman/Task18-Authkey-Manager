//
//  DBHandlerProtocol.swift
//  Task 18 (6th Jan)
//
//  Created by Moh. Absar Rahman on 8/1/23.
//

import Foundation

// CUSTOM PROTOCOL FOR CONFORMING CRUD OPERATIONS
protocol DBHandlerProtocol {
    func addData()
    func removeData()
    func updateData()
    func fetchData()
}
