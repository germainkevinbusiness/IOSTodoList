//
//  LoginView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                   HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    rotationAngle: 15,
                    backgroundColor: Color.pink
                   )
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(
                                viewModel.errorMessage
                            ).foregroundColor(
                                Color.red
                            )
                        }
                        TextField(
                            "Email Address",
                            text: $viewModel.email
                        ).textFieldStyle(
                            RoundedBorderTextFieldStyle()
                        )
                        
                        SecureField(
                            "Password",
                            text: $viewModel.password
                        ).textFieldStyle(
                            RoundedBorderTextFieldStyle()
                        )
                        
                        TLButton(
                            title: "Log in",
                            backgroundColor: .blue,
                            titleColor: .white
                        ){
                            viewModel.login()
                        }
                    }
                    
                    VStack {
                        Text(
                            "New around here?"
                        )
                        NavigationLink(
                            "Create an Account",
                            destination: RegisterView()
                        )
                    }.padding(
                        .bottom,
                        50
                    )
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
