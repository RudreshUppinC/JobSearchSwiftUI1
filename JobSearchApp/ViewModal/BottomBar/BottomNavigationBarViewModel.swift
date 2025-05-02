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
    
    func otherTab(_ tab: Tab, mainScreenViewModel: MainScreenViewModel) {
        selectedTab = tab
        mainScreenViewModel.isCenterPlusButton = false
    }
    
    func postTab(_ tab: Tab, mainScreenViewModel: MainScreenViewModel) {
        selectedTab = tab
        mainScreenViewModel.isCenterPlusButton.toggle()
        withAnimation {
            mainScreenViewModel.showBottomSheet = mainScreenViewModel.isCenterPlusButton
        }
    }
    func resetSheetAnimation( mainScreenViewModel: MainScreenViewModel)
    {
        mainScreenViewModel.showBottomSheet = false
        mainScreenViewModel.isCenterPlusButton = false
    }
   
   
}

