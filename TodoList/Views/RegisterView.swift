//
//  RegisterView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
             title: "Register",
             subtitle: "Start organizing todos",
             rotationAngle: -15,
             backgroundColor: Color.yellow
            )
            Spacer()
            Form {
                TextField(
                    "Full name",
                    text: $viewModel.fullName
                ).textFieldStyle(
                    RoundedBorderTextFieldStyle()
                )
                .autocapitalization(
                    .none
                )
                .autocorrectionDisabled()
                
                TextField(
                    "Email Address",
                    text: $viewModel.email
                ).textFieldStyle(
                    RoundedBorderTextFieldStyle()
                ).autocapitalization(
                    .none
                )
                .autocorrectionDisabled()
                
                SecureField(
                    "Password",
                    text: $viewModel.password
                ).textFieldStyle(
                    RoundedBorderTextFieldStyle()
                )
                TLButton(
                    title: "Create account",
                    backgroundColor: .green,
                    titleColor: .white
                ){
                    viewModel.register()
                }
            }.offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
