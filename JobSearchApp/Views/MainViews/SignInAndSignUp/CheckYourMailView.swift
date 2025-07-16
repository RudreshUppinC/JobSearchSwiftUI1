//
//  CheckYourMailView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import SwiftUI
import UIKit

@available(iOS 16.0, *)
struct CheckYourMailView: View {
    @Binding var isBackToLogin: Bool
    @StateObject var checkyourmailviewmodal =  CheckYourMailViewModal()
    @State var isSuccessFullView = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.whisperGray
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .center) {
                        Text("Check Your Email")
                            .font(FontStyle.dmsansBold.font(baseSize: 30))
                            .foregroundColor(AppColors.deepIndigo)
                            .padding(.top)
                        Text("We have sent the reset password to the email address")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.dustyLavender)
                            .multilineTextAlignment(.center)
                        
                            .padding(.top,5)

                        Text(checkyourmailviewmodal.email)
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.dustyLavender)
                            .multilineTextAlignment(.center)
                        
                        ImageProvider.getImage(named: "checkyourEmail1").map{ image in
                            Image(uiImage: image)
                                .scaledToFit()
                                .frame(width: 118,height: 93)
                                .padding(.top, 50)
                                .padding(.bottom, 94)
                        }
                        
                        NavigationLink(destination: SuccessfullyView(isBackToLogin: $isBackToLogin),
                                       isActive: $isSuccessFullView) {
                            CustomButton(title: "OPEN YOUR EMAIL", backgroundColor: AppColors.deepIndigo) {
                                print("Reset Password Button Tapped")
                                isSuccessFullView = true
                            }
                            .padding(.bottom, 10)
                        }
                        
                        
                        CustomButton(title: "BACK TO LOGIN", backgroundColor: AppColors.pastelLavender) {
                            print("Reset Password Button Tapped")
                            isBackToLogin = false
                        }
                        .padding(.bottom, 15)
                        
                        HStack{
                            Text("You have not received the email?")
                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                .foregroundColor(AppColors.darkIndigoColor)
                            
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
                .ignoresSafeArea(.all)
                .padding(.vertical,5)
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    
}

#Preview {
    if #available(iOS 16.0, *) {
        @State var isBackToLogin = false
        CheckYourMailView(isBackToLogin: $isBackToLogin)
    } else {
        // Fallback on earlier versions
    }
}
