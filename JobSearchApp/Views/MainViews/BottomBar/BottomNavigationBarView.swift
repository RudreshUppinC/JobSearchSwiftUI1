
import SwiftUI
//
//  BottomNavigationBarView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/03/25.
//

import SwiftUI

struct BottomNavigationBarView: View {
    @StateObject var viewModel =  BottomNavigationBarViewModel()

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                if tab == .post {
                    Button(action: { viewModel.selectTab(tab) }) {
                        ZStack {
                            Circle()
                                .fill(AppColors.deepIndigo)
                                .frame(width: 50, height: 50)
                            Image(viewModel.selectedTab == tab ? tab.imageNameSelected : tab.imageNameUnselected)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .offset(y: -10)

                    }
                    .frame(maxWidth: .infinity)
                    Spacer()

                } else {
                    Button(action: { viewModel.selectTab(tab) }) {
                        VStack {
                            Image(viewModel.selectedTab == tab ? tab.imageNameSelected : tab.imageNameUnselected)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .frame(height: 80)
        .background(.white)
    }

}

#Preview {
    BottomNavigationBarView(viewModel: BottomNavigationBarViewModel())
}
