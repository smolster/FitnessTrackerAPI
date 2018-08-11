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
    
    var userId: User.ID
    
    init(id: Int? = nil, entryDate: Date, userId: User.ID) {
        self.id = id
        self.entryDate = entryDate
        self.userId = userId
    }
}
