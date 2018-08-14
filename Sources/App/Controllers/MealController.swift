//
//  MealController.swift
//  App
//
//  Created by Swain Molster on 8/10/18.
//

import Vapor
import FluentSQLite

final class MealController {
    
    /// Returns a list of all meals for the auth'd user.
    func index(_ req: Request) throws -> Future<[Meal]> {
        // fetch auth'd user
        let user = try req.requireAuthenticated(User.self)
        
        // query all todo's belonging to user
        return try Meal.query(on: req).filter(\.userID == user.requireID()).all()
    }
    
    /// Creates a new todo for the auth'd user.
    func create(_ req: Request) throws -> Future<Meal> {
        // fetch auth'd user
        let user = try req.requireAuthenticated(User.self)
        
        // decode request content
        return try req.content.decode(CreateMealRequest.self).flatMap { mealRequest in
            // save new todo
            return try Meal(entryDate: mealRequest.entryDate, userID: user.requireID())
                            .save(on: req)
        }
    }
    
}

struct CreateMealRequest: Codable {
    let entryDate: Date
}
