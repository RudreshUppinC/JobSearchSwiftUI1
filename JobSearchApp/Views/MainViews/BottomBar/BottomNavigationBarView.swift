
import SwiftUI
//
//  BottomNavigationBarView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import SwiftUI

struct BottomNavigationBarView: View {
    @ObservedObject var viewModel :  BottomNavigationBarViewModel

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                if tab == .post {
                    Button(action: {
                        viewModel.selectPostTab(tab)
                    }) {
                        ZStack {
                            Circle()
                                .fill(AppColors.deepIndigo)
                                .frame(width: 45, height: 45)
                            Image(viewModel.selectedTab == tab ? tab.imageNameSelected : tab.imageNameUnselected)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 15, height: 15)
                                .rotationEffect(.degrees(viewModel.isCenterPlusButton ? 45 : 0))
                                .animation(.easeInOut(duration: 0.3), value: viewModel.isCenterPlusButton)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()

                } else {
                    Button(action: {
                        viewModel.selectTab(tab)
                    }) {
                        VStack {
                            Image(viewModel.selectedTab == tab ? tab.imageNameSelected : tab.imageNameUnselected)
                                .frame(width: 24, height: 20)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .frame(height: 70)
        .background(.white)
    }

}

#Preview {
    BottomNavigationBarView(viewModel: BottomNavigationBarViewModel())
}
