//
//  NewItemView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColor: Color
    let titleColor: Color
    let action: () -> Void
    
    
    var body: some View {
        Button(action: {action()},
               label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(titleColor).bold()
            }
        }).padding()
    }
}

#Preview {
    TLButton(
        title: "Log in",
        backgroundColor: .blue,
        titleColor: .white
    ){
        
    }
}
