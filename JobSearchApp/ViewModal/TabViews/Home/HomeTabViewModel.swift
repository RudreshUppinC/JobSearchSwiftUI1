//
//  HomeTabViewModel.swift
//  JobSearchApp
//
//  Created by DarkMoon on 30/03/25.
//

import Foundation
import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    @Published var isNavigateSeeMoreJobs:Bool = false
    @Published var isNavigateProfileView:Bool = false
    @Published var userProfile: UserProfile
    
    init(){
        self.userProfile = UserProfile.exampleLoaded
    }
    
    public func showUserProfile() {
        isNavigateProfileView = true
    }
    
}

