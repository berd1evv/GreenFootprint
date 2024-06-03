//
//  AuthViewModel.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "All fields are required"
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = "Failed to login: \(error.localizedDescription)"
            } else {
                Storage.shared.setActive(true)
                self.errorMessage = "User logged in successfully"
            }
        }
    }
    
    func register() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "All fields are required"
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = "Failed to register: \(error.localizedDescription)"
            } else {
                Storage.shared.setActive(true)
                self.errorMessage = "User registered successfully"
            }
        }
    }
    
    func reset(completion: @escaping ()->()) {
        guard !email.isEmpty else {
            errorMessage = "Email field is empty"
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.errorMessage = "Failed to send password reset email: \(error.localizedDescription)"
            } else {
                completion()
            }
        }
    }
}
