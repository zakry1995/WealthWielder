//
//  AuthenticationViewModel.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/17/24.
//

import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    @Published var user: User?  // Ensure there is a 'User' struct defined somewhere
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if authResult != nil {
                    self?.isAuthenticated = true
                }
            }
        }
    }

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = "Registration failed: \(error.localizedDescription)"
                } else {
                    self?.isAuthenticated = true  // Optionally log in the user immediately after registration
                }
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
        } catch let error as NSError {
            errorMessage = error.localizedDescription
        }
    }
}
