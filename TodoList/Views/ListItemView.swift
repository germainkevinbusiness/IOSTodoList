//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI

struct ListItemView: View {
    
    var todoItem: TodoItem
    
    @StateObject var viewModel = ListItemViewViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todoItem.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: todoItem.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                viewModel.toggleIsDone()
            }, label: {
                Image(systemName: todoItem.isDone ? "checkmark.circle.fill" : "circle")
            })
        }
    }
}

#Preview {
    ListItemView(
        todoItem: .init(
            id: "13",
            title: "Get some milk",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
    )
}
