//
//  SignInView.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/17/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State private var showRegistration = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            if showRegistration {
                Button("Register") {
                    authViewModel.register(email: email, password: password)
                }
                .padding()
            } else {
                Button("Sign In") {
                    authViewModel.signIn(email: email, password: password)
                }
                .padding()
            }

            Button(showRegistration ? "Switch to Sign In" : "Switch to Register") {
                showRegistration.toggle()  
            }
        }
    }
}
