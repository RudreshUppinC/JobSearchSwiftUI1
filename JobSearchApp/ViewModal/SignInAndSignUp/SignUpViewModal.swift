//
//  SignUpViewModal.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 13/03/25.
//

import Foundation
import Combine

class SignUpViewModal: ObservableObject {
    
    @Published var fullname = "Brandone Louis "
    @Published var email = "Brandonelouis@gmail.com"
    @Published var  password = ""
    @Published var rememberMe = false
    @Published var showForgetPasswordView = false
    @Published var isLoginViewBack = false
    @Published var isPasswordVisible = false
    
    func showLoginView() {
        isLoginViewBack = true
    }
}
