//
//  TodoListView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    
    @StateObject var viewModel = TodoListViewViewModel()
    @FirestoreQuery var todoItems: [TodoItem]
    
    init(userId: String) {
        self._todoItems = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(todoItems) { item in
                    ListItemView(todoItem: item).swipeActions {
                        Button("Delete") {
                            viewModel.delete(item: item.id)
                        }.foregroundColor(.red)
                    }
                }
                .listStyle(PlainListStyle())
                
            }.navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    viewModel.showingNewItemView = true
                },
                label: {
                    Image( systemName: "plus")
                })
            }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    TodoListView(userId: "")
}
