//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Kevin Germain on 07/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newTodoItemId = UUID().uuidString
        let newTodoItem = TodoItem(
            id: newTodoItemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone:false
        )
        
        // Save model
        let db = Firestore.firestore()
        db
            .collection("users")
            .document(uID)
            .collection("todos")
            .document(newTodoItemId)
            .setData(newTodoItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        // It substracts today to 24hrs, meaning, make sure that this number
        // is greater than yesterday, which means make sure that this due date
        // is either today or greater
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
