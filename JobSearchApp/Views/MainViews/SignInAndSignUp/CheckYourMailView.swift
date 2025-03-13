//
//  CheckYourMailView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/02/25.
//

import SwiftUI
import UIKit

@available(iOS 16.0, *)
struct CheckYourMailView: View {
    @Binding var isBackToLogin: Bool
    @ObservedObject var checkyourmailviewmodal = CheckYourMailViewModal()

    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.uiuxBgcolor
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .center) {
                        Text("Check Your Email")
                            .font(FontStyle.dmsansBold.font(baseSize: 30))
                            .foregroundColor(AppColors.texColor12)
                            .padding(.top)
                        Text("We have sent the reset password to the email address")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.texColor14)
                            .multilineTextAlignment(.center)
                            .padding(.top, 5)
                        
                        Text(checkyourmailviewmodal.email)
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.texColor14)
                            .multilineTextAlignment(.center)
                        Image("checkyourEmail1")
                            .scaledToFit()
                            .frame(width: 118,height: 93)
                            .padding(.top, 50)
                            .padding(.bottom, 94)
                        
                        CustomButton(title: "OPEN YOUR EMAIL", backgroundColor: AppColors.texColor12) {
                            // Reset Password Action
                            print("Reset Password Button Tapped")
                        }
                        .padding(.bottom, 25)
                        
                        CustomButton(title: "BACK TO LOGIN", backgroundColor: AppColors.lightPink1) {
                            print("Reset Password Button Tapped")
                            isBackToLogin = false
                        }
                        .padding(.bottom, 25)
                        
                        HStack{
                            Text("You have not received the email?")
                                .font(FontStyle.dmsansBold.font(baseSize: 10))
                                .foregroundColor(AppColors.texColor14)
                            
                            Button{
                                
                            }label:{
                                Text("Resend")
                                    .font(FontStyle.dmsansBold.font(baseSize: 10))
                                    .foregroundColor(AppColors.orangeColor)
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal,30)
                    .navigationBarTitleDisplayMode(.inline)
                   
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
//    func dismissToLogin() {
//            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//                if let coordinator = windowScene.delegate as? SceneDelegate {
//                    // Reset the navigation stack by replacing the root view controller
//                    coordinator.window?.rootViewController = UIHostingController(rootView: LoginView(viewModel: LoginViewModel()))
//                    coordinator.window?.makeKeyAndVisible()
//                }
//            }
//    }
}

#Preview {
    if #available(iOS 16.0, *) {
        @State var isBackToLogin = false
        CheckYourMailView(isBackToLogin: $isBackToLogin)
    } else {
        // Fallback on earlier versions
    }
}
