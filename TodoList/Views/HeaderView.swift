//
//  HeaderView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let rotationAngle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: rotationAngle))
            VStack {
                Text(title)
                .font(.system(size: 50))
                .foregroundColor(.white)
                
                Text(subtitle).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }.padding(.top, 30)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 350
        ).offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "To Do List",
        subtitle: "Get things done",
        rotationAngle: -15,
        backgroundColor: Color.pink
    )
}
