//
//  LoginViewModel.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 13/03/25.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rememberMe: Bool = false
    @Published var isNavigateToSignUp: Bool = false
    @Published var isPasswordVisible: Bool = false
    @Published var isBackToLogin: Bool = false
    @Published var isNavigateToLoginSuccess = false
    
    func showForgotPassword() {
        isBackToLogin = true
    }
    
    func showSignUpView() {
        isNavigateToSignUp = true
    }
    
}
