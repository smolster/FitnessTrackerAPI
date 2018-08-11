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
    func index(_ req: Request) throws -> Future<[Todo]> {
        // fetch auth'd user
        let user = try req.requireAuthenticated(User.self)
        
        // query all todo's belonging to user
        return try  Todo.query(on: req)
            .filter(\.userID == user.requireID()).all()
    }
    
    /// Creates a new todo for the auth'd user.
    func create(_ req: Request) throws -> Future<Todo> {
        // fetch auth'd user
        let user = try req.requireAuthenticated(User.self)
        
        // decode request content
        return try req.content.decode(CreateTodoRequest.self).flatMap { todo in
            // save new todo
            return try Todo(title: todo.title, userID: user.requireID())
                .save(on: req)
        }
    }
    
}
