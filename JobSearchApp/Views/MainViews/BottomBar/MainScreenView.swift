//
//  HomeScreenView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct MainScreenView: View {
    @StateObject private var viewModel = BottomNavigationBarViewModel()
    @StateObject  var mainScreenViewModel = MainScreenViewModel()
    @StateObject  var recentJobListViewModel = RecentJobsListViewModel()

    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.paleGray
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    switch viewModel.selectedTab{
                    case .home:
                        HomeTabView(mainScreenViewModel: mainScreenViewModel, recentJobListViewModel: recentJobListViewModel)
                    case .connect:
                        MyConnectTabView(mainScreenViewModel: mainScreenViewModel)
                    case .post:
                        PostTabView(mainScreenViewModel: mainScreenViewModel, viewModel: viewModel)
                    case .chat:
                        ChatTabView(mainScreenViewModel: mainScreenViewModel)
                    case .bookmark:
                        BookMarkTabView(mainScreenViewModel: mainScreenViewModel, recentJobListViewModel: recentJobListViewModel)
                    }
                    
                    BottomNavigationBarView(viewModel: viewModel, mainScreenViewModel: mainScreenViewModel)
                }
                
            }
        }
        .onChange(of: viewModel.selectedTab) { tab in
                   if tab == .post {
                       withAnimation {
                           mainScreenViewModel.showBottomSheet = true
                       }
                   } else {
                       withAnimation {
                           mainScreenViewModel.showBottomSheet = false
                       }
                   }
        }
        
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        MainScreenView()
    } else {
        // Fallback on earlier versions
    }
}
