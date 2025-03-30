//
//  BottomNavigationBarViewModel.swift
//  JobSearchApp
//
//  Created by Way2 on 27/03/25.
//

import Foundation
import SwiftUI

class BottomNavigationBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home 
    @Published var showBottomSheet: Bool = false

    func selectTab(_ tab: Tab) { // Accept a Tab enum value
        selectedTab = tab
        // Add any other logic needed when a tab is selected
        print("Navigating to tab: \(tab.rawValue)")  //For debug to make sure its working
    }
}

