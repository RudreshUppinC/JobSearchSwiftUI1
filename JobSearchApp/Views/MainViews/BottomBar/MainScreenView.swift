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
    @StateObject private var viewModel1 = HomeTabViewModel()

    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.paleGray
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    switch viewModel.selectedTab{
                    case .home:
                        HomeTabView()
                    case .connect:
                        MyConnectTabView()
                    case .post:
                        PostTabView(viewModel: viewModel)
                    case .chat:
                        ChatScreenView()
                    case .bookmark:
                        BookMarkTabView(viewModel: viewModel, hometabviewmodel: viewModel1)
                    }
                    
                    BottomNavigationBarView(viewModel: viewModel)
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
