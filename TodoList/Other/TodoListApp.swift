//
//  TodoListApp.swift
//  TodoList
//
//  Created by Kevin Germain on 23/10/2023.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
