//
//  MainSplashScreen.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct MainSplashScreen: View {
    
    @State private var isNavigateToUploadView = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                // Background Color
                AppColors.paleGray
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            Text("Jobspot")
                                .font(FontStyle.dmsansBold.font(baseSize: 18))
                                .foregroundColor(AppColors.black)
                                .padding(.trailing, 32)
                            
                        }
                        .padding(.bottom, 90)
                        
                        VStack {
                            ImageProvider.getImage(named: "bgJobSpot").map{ image in
                                Image(uiImage: image)
                                    .padding(.horizontal, 32)
                                    .offset(y: 140)
                            }
                            
                            ImageProvider.getImage(named: "bgJobSpot1").map{ image in
                                Image(uiImage: image)
                                    .padding(.leading, 75)
                                    .padding(.trailing, 50)
                                    .offset(y: -160)
                            }
                        }
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 78)
                        
                      VStack(alignment: .leading, spacing: 0) {

                            Text("Find Your")
                                .font(FontStyle.dmsansBold.font(baseSize: 40))
                                .foregroundColor(AppColors.black)
                            Text("Dream Job")
                                    .font(FontStyle.dmsansBold.font(baseSize: 40))
                                    .foregroundColor(AppColors.flameOrange)
                                    .underline(true, color: AppColors.flameOrange)
                                    .padding(.top, -10)
                            Text("Here!")
                                .font(FontStyle.dmsansBold.font(baseSize: 40))
                                .foregroundColor(.black)
                                .fixedSize(horizontal: true, vertical: false)
                                .padding(.top, -10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 28)

                        VStack {
                            Text("Explore all the most exciting job roles based on your interest and study major.")
                                .font(FontStyle.dmsansRegular.font(baseSize: 14))
                                .foregroundColor(AppColors.dustyLavender)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 29)
                        .padding(.top, 15)

                        VStack {
                            NavigationLink(destination: LoginView(), isActive: $isNavigateToUploadView) {
                                Button(action: {
                                    print("Button tapped!")
                                    isNavigateToUploadView = true
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(AppColors.darkIndigoColor)
                                            .frame(width: 60, height: 60)
                                        ImageProvider.getImage(named: "nextArrow").map{ image in
                                            Image(uiImage: image)
                                                .frame(width: 23, height: 26)
                                        }
                                    }
                                }
                                .padding(.trailing, 20)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.vertical,5)
                .onAppear{
                    print("Hello")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        MainSplashScreen()
    } else {
        // Fallback on earlier versions
    }
}
