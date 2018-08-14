//
//  Meal.swift
//  App
//
//  Created by Swain Molster on 8/10/18.
//

import Vapor
import FluentSQLite

final class Meal: SQLiteModel {
    var id: Int?
    
    var entryDate: Date
    
    var userID: User.ID
    
    init(id: Int? = nil, entryDate: Date, userID: User.ID) {
        self.id = id
        self.entryDate = entryDate
        self.userID = userID
    }
}
