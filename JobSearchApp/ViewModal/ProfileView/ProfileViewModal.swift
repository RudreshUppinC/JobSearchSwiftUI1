//
//  ProfileViewModal.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 19/05/25.
//

import Foundation
import SwiftUI
import Combine

class ProfileViewModal: ObservableObject {
    @Published var isAboutMeDetailView: Bool  = false
    @Published var isEditProfileDetailView: Bool  = false
    @Published var userProfile: UserProfile
    @Published var isWorkDetailView: Bool  = false

    init(userProfile:UserProfile) {
        self.userProfile = userProfile
    }
       
    func showAboutMeDetailView() {
        isAboutMeDetailView = true
    }
    
    func addEducationTapped(){
        print(#function)
        
    }
    
    func editEducationTapped(){
        print(#function)
        
    }
      
}
