//
//  User.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let fullName: String
    let email:String
    let joined: TimeInterval    
}
