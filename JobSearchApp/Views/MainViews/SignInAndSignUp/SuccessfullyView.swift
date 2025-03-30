//
//  SuccessfullyView.swift
//  JobSearchApp
//
//  Created by Way2 on 04/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct SuccessfullyView: View {
    @State private var email = "brandonelouis@gmial.com"
    @Binding var isBackToLogin: Bool

    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.whisperGray
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .center) {
                        Text("Successfully")
                            .font(FontStyle.dmsansBold.font(baseSize: 30))
                            .foregroundColor(AppColors.deepIndigo)
                            .padding(.top)
                        Text("Your password has been updated, please change your password regularly to avoid this happening ")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.dustyLavender)
                            .multilineTextAlignment(.center)
                            .padding(.top, 5)
                        
                        ImageProvider.getImage(named: "succfullyEmail").map{ image in
                            Image(uiImage: image)
                                .scaledToFit()
                                .frame(width: 118,height: 93)
                                .padding(.top, 51)
                                .padding(.bottom, 115)
                        }
                                                
                        
                        CustomButton(title: "CONTINUE", backgroundColor: AppColors.deepIndigo) {
                            // Reset Password Action
                            print("Reset Password Button Tapped")
                        }
                        
                        CustomButton(title: "BACK TO LOGIN", backgroundColor: AppColors.pastelLavender) {
                            // Reset Password Action
                            isBackToLogin = false
                        }
                        .padding(.bottom, 15)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal,30)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    if #available(iOS 16.0, *) {
        @State var isBackToLogin = false
        SuccessfullyView(isBackToLogin: $isBackToLogin)
    } else {
        // Fallback on earlier versions
    }
}
