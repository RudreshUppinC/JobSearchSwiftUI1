//
//  BottomNavigationBarViewModel.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import Foundation
import SwiftUI

class BottomNavigationBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published var isCenterPlusButton:Bool = false
    @Published var showBottomSheet: Bool = false

    func selectTab(_ tab: Tab) {
        selectedTab = tab
        self.isCenterPlusButton = false
    }
    
    func selectPostTab(_ tab: Tab) {
        selectedTab = tab
        self.isCenterPlusButton.toggle()
        self.showBottomSheet = !self.showBottomSheet
        
    }
    
}

