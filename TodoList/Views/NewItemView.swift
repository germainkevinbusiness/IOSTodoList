//
//  NewItemView.swift
//  TodoList
//
//  Created by Kevin Germain on 07/11/2023.
//

import Foundation
import SwiftUI

struct NewItemView : View {
    
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body : some View {
        VStack {
            Text("New item").font(.system(size: 32)).bold().textFieldStyle(DefaultTextFieldStyle()).padding(.top, 100)
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", backgroundColor: Color.pink, titleColor: .white, action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }).padding()
            }.alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text( "Error"),
                    message: Text("Please fill in the fields and select a due date that is today or newer")
                )
            }
        }
    }
}
