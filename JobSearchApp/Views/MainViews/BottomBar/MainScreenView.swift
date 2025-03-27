//
//  HomeScreenView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct MainScreenView: View {
    @StateObject private var viewModel = BottomNavigationBarViewModel()

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
                        MyConnectView()
                    case .post:
                        DeleteAllView()
                    case .chat:
                        DeleteAllView()
                    case .bookmark:
                        BookmarkScreenView()
                   
                    }
                    Spacer()
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
