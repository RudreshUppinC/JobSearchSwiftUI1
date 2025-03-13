//
//  ForgetPasswordViewModal.swift
//  JobSearchApp
//
//  Created by Way2 on 13/03/25.
//

import Foundation
import Combine

class ForgotPasswordViewModal: ObservableObject {
    
    @Published var email = ""
    @Published var isCheckYourMailView = false

    func showCheckYourMailView() {
       
        isCheckYourMailView = true
    }

}

