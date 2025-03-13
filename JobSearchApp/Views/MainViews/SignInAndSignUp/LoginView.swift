//
//  LoginView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/02/25.
//


import SwiftUI
import Combine

@available(iOS 16.0, *)

struct LoginView: View {
    @ObservedObject var loginViewModal = LoginViewModel()
    
    @StateObject private var viewModal = UploadCVViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.uiuxBgcolor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack(alignment: .center) {
                        Text("Welcome Back")
                            .font(FontStyle.dmsansBold.font(baseSize: 30))
                            .foregroundColor(AppColors.texColor12)
                            .padding(.bottom, 5)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur  adipiscing \n elit nsed do eiusmod tempor")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.secondaryTextColor)
                            .padding(.horizontal, 25)
                            .padding(.bottom, 30)
                        
                        VStack(alignment: .leading) {
                            Text("Email")
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.texColor12)
                            
                            TextField("Email Address", text: $loginViewModal.email)
                                .padding()
                                .background(AppColors.textFieldBgView)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading) {
                            Text("Password")
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.texColor12)
                            
                            HStack {
                                SecureField("Password", text: $loginViewModal.password)
                                    .padding()
                                    .autocapitalization(.none)
                                HStack {
                                    Button(action: {
                                        loginViewModal.isPasswordVisible.toggle()
                                        print("Toggle", $loginViewModal.isPasswordVisible)
                                    }) {
                                        Image(systemName: loginViewModal.isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                            .foregroundColor(AppColors.eyePasswordColor)
                                            .padding(5)
                                    }
                                    .cornerRadius(10)
                                }
                            }
                            .background(AppColors.textFieldBgView)
                            
                        }
                        .padding(.bottom, 10)
                        VStack {
                            HStack{
                                Button{
                                    loginViewModal.rememberMe.toggle()
                                } label: {
                                    Image(systemName: loginViewModal.rememberMe ? "checkmark.square.fill" : "square")
                                        .foregroundColor(AppColors.texColor12)
                                    
                                }
                                .frame(width:25,height: 25)
                                
                                
                                Text("Remember me")
                                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Button("Forgot Password?") {
                                    print("Forgot Password tapped")
                                    loginViewModal.showForgotPassword()
                                }
                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                .foregroundColor(AppColors.texColor12)
                                .fullScreenCover(isPresented: $loginViewModal.isBackToLogin) {
                                    ForgotPasswordView(isBackToLogin: $loginViewModal.isBackToLogin)
                                }
                                
                            }
                            
                            
                            NavigationLink(destination:  HomeScreenView()
                                           , isActive: $loginViewModal.isNavigateToLoginSuccess){
                                Button(action: {
                                    // Handle login action
                                    loginViewModal.isNavigateToLoginSuccess = true
                                    print("Login tapped")
                                }) {
                                    Text("LOGIN")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color(red: 0.145, green: 0.145, blue: 0.345)) // Dark blue color
                                        .cornerRadius(10)
                                }
                                .padding(.bottom, 15)
                            }
                            
                            Button(action: {
                                // Handle sign in with Google action
                                print("Sign in with Google tapped")
                            }) {
                                HStack {
                                    Image("googlelogo1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    Text("SIGN IN WITH GOOGLE")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                }
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(AppColors.lightPink1)
                                .cornerRadius(10)
                            }
                            .padding(.bottom, 10)
                            
                            Spacer()
                            HStack(alignment: .center) {
                                Text("You don't have an account yet?")
                                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                    .foregroundColor(.gray)
                                NavigationLink(destination: SignUpView(),isActive: $loginViewModal.isNavigateToSignUp) {
                                    
                                    Button {
                                        print("Sign up tapped")
                                        loginViewModal.showSignUpView()
                                    } label: {
                                        Text("Sign Up")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                            .foregroundColor(AppColors.sigUpTextLabelColor)
                                            .underline()
                                    }
                                }
                                
                            }
                            
                        }
                        
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(AppColors.uiuxBgcolor)
                    }
                    .padding()
                    
                }
                
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    
}

// Placeholder for Google Logo - you need to add your Google logo to the assets
struct GoogleLogoPlaceholder: View {
    var body: some View {
        Circle()
            .fill(.gray)
            .frame(width: 20, height: 20)
    }
}



#Preview {
    if #available(iOS 16.0, *) {
        LoginView()
    } else {
        // Fallback on earlier versions
    }
}




