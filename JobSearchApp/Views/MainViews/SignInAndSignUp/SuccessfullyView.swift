//
//  SuccessfullyView.swift
//  JobSearchApp
//
//  Created by Way2 on 04/03/25.
//

import SwiftUI

struct SuccessfullyView: View {
    @State private var email = "brandonelouis@gmial.com"
    var body: some View {
        ZStack{
            AppColors.uiuxBgcolor
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack(alignment: .center) {
                    Text("Successfully")
                        .font(FontStyle.dmsansBold.font(baseSize: 30))
                        .foregroundColor(AppColors.texColor12)
                        .padding(.top)
                    Text("Your password has been updated, please change your password regularly to avoid this happening ")
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(AppColors.texColor14)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                    
                    Image("succfullyEmail")
                        .scaledToFit()
                        .frame(width: 118,height: 93)
                        .padding(.top, 51)
                        .padding(.bottom, 115)
                    
                    CustomButton(title: "CONTINUE", backgroundColor: AppColors.texColor12) {
                        // Reset Password Action
                        print("Reset Password Button Tapped")
                    }
                    .padding(.bottom, 25)
                    
                    CustomButton(title: "BACK TO LOGIN", backgroundColor: AppColors.lightPink1) {
                        // Reset Password Action
                        print("Reset Password Button Tapped")
                    }
                    .padding(.bottom, 25)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal,30)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    SuccessfullyView()
}
