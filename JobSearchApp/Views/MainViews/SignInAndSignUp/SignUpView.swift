//
//  SignUpView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/02/25.
//

import SwiftUI


@available(iOS 16.0, *)
struct SignUpView: View {
    

    @ObservedObject var signupviewmodal = SignUpViewModal()
    var body: some View {
        NavigationStack {
            ZStack{
                AppColors.uiuxBgcolor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack(alignment: .center) {
                        Text("Create an Account")
                            .font(FontStyle.dmsansBold.font(baseSize: 30))
                            .foregroundColor(AppColors.texColor12)
                            .padding(.bottom, 5)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.secondaryTextColor)
                            .padding(.bottom, 30)
                        
                        VStack(alignment: .leading) {
                            Text("Full name")
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.texColor12)
                            
                            TextField("Email", text: $signupviewmodal.fullname)
                                .padding()
                                .foregroundColor(AppColors.texColor12.opacity(0.6))
                                .background(AppColors.textFieldBgView)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading) {
                            Text("Email")
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.texColor12)
                            
                            TextField("Email Address", text: $signupviewmodal.email)
                                .foregroundColor(AppColors.texColor12.opacity(0.6))
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
                                SecureField("", text: $signupviewmodal.password, prompt: Text("Password").foregroundColor(.gray))
                                    .padding()
                                    .autocapitalization(.none)
                                    .foregroundColor(.black)
                                Button(action: {
                                    signupviewmodal.isPasswordVisible.toggle()
                                    print("Toggle", signupviewmodal.isPasswordVisible)
                                }) {
                                    Image(systemName: signupviewmodal.isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                        .foregroundColor(AppColors.eyePasswordColor)
                                        .padding(10)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(AppColors.textFieldBgView)
                            )
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            HStack{
                                Button{
                                    signupviewmodal.rememberMe.toggle()
                                } label: {
                                    Image(systemName: signupviewmodal.rememberMe ? "checkmark.square.fill" : "square")
                                        .foregroundColor(AppColors.texColor12)
                                    
                                }
                                .frame(width:25,height: 25)
                                
                                
                                Text("Remember me")
                                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            Button("Forgot Password?") {
                                signupviewmodal.showForgetPasswordView.toggle()
                            }
                            .font(FontStyle.dmsansBold.font(baseSize: 12))
                            .foregroundColor(AppColors.texColor12)
                            .fullScreenCover(isPresented: $signupviewmodal.showForgetPasswordView) {
                                ForgotPasswordView(isBackToLogin: $signupviewmodal.showForgetPasswordView)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        Button(action: {
                            // Handle login action
                            print("Login tapped")
                        }) {
                            Text("SIGN UP")
                                .font(FontStyle.dmsansBold.font(baseSize: 14))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.145, green: 0.145, blue: 0.345)) // Dark blue color
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 15)
                        
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
                                    .foregroundColor(.white)
                                
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
                            Text("Already have a account?")
                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                .foregroundColor(.gray)
                            NavigationLink(destination: LoginView(),isActive: $signupviewmodal.isLoginViewBack) {
                                Button {
                                    // Handle sign up action
                                    print("Login Here")
                                    signupviewmodal.showLoginView()

                                } label: {
                                    Text("Login")
                                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                        .foregroundColor(AppColors.sigUpTextLabelColor)
                                        .underline()
                                }
                            }
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(AppColors.uiuxBgcolor)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        SignUpView()
    } else {
        // Fallback on earlier versions
    }
}




