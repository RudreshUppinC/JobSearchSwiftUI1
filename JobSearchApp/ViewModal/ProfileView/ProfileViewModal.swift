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

    @Published var aboutMeText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor."
    @Published var userProfile: UserProfile

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
