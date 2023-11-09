//
//  ProfileView.swift
//  TodoList
//
//  Created by Kevin Germain on 24/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
