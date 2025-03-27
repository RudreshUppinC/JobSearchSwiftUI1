//
//  ForgetPasswordView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/02/25.
//

import SwiftUI
@available(iOS 16.0, *)
struct ForgotPasswordView: View {
    @Binding var isBackToLogin: Bool
    @ObservedObject var forgetPasswordViewModel: ForgotPasswordViewModal
    
    init(isBackToLogin: Binding<Bool>) {
        self._isBackToLogin = isBackToLogin
        self.forgetPasswordViewModel = ForgotPasswordViewModal()
    }
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.whisperGray
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .center) {
                        Text("Forgot Password?")
                            .font(FontStyle.dmsansBold.font(baseSize: 30))
                            .foregroundColor(AppColors.deepIndigo)
                            .padding(.top)
                            .padding(.bottom,11)
                        
                        
                        Text("To reset your password, you need your email or mobile number that can be authenticated")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.skyLavender)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,20)
                        
                        Image("forgetPasswordImage1")
                            .scaledToFit()
                            .frame(width: 118,height: 93)
                            .padding(.vertical, 50)
                        
                        VStack(alignment:.leading){
                            Text("Email")
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.deepIndigo)
                                .padding(.bottom, 8)
                            TextField("enter your email", text: $forgetPasswordViewModel.email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 15)
                        
                        NavigationLink(destination: CheckYourMailView(isBackToLogin: $isBackToLogin),
                                       isActive: $forgetPasswordViewModel.isCheckYourMailView) {
                            CustomButton(title: "RESET PASSWORD", lightGrayBlue: AppColors.deepIndigo) {
                                print("Reset Password Button Tapped")
                                forgetPasswordViewModel.showCheckYourMailView()
                            }
                            .padding(.bottom, 10)
                        }
                        
                        CustomButton(title: "BACK TO LOGIN", lightGrayBlue: AppColors.pastelLavender) {
                            isBackToLogin = false
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
}



struct CustomButton: View {
    let title: String
    let lightGrayBlue: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(lightGrayBlue)
                .cornerRadius(10)
        }
        .padding(.bottom, 10)
        
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        @State var isBackToLogin = true
        ForgotPasswordView(isBackToLogin: $isBackToLogin)
    } else {
        // Fallback on earlier versions
    }
}
