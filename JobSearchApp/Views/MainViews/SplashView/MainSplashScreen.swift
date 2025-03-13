//
//  MainSplashScreen.swift
//  JobSearchApp
//
//  Created by Way2 on 27/02/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct MainSplashScreen: View {
    @State private var isNavigateToUploadView = false

    var body: some View {
        NavigationStack{
            ZStack {
                // Background Color
                Color("bgMianView").ignoresSafeArea(.all)
                
                ScrollView {
                    VStack {
                        // JobSpot Text with Padding
                        HStack {
                            Spacer()
                            Text("JobSpot")
                                .font(FontStyle.dmsansBold.font(baseSize: 18))
                                .foregroundColor(.black)
                                .padding(.trailing, 32)

                        }
                        .padding(.bottom, 90)
                        
                        // Background Images (bgJobSpot & bgJobSpot1)
                        VStack {
                            Image("bgJobSpot")
                                .padding(.horizontal, 32)
                                .offset(y: 140)
                            
                            Image("bgJobSpot1")
                                .padding(.leading, 75)
                                .padding(.trailing, 50)
                                .offset(y: -160)
                        }
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 78)
                        
                        // Texts: Find Your, Dream Job, JobSpot
                        VStack(spacing: 0) {
                            Text("Find Your")
                                .font(FontStyle.dmsansBold.font(baseSize: 40))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Dream Job")
                                .font(FontStyle.dmsansBold.font(baseSize: 40))
                                .foregroundColor(Color("textColorYellow"))
                                .underline(true, color: Color("textColorYellow"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Here!")
                                .font(FontStyle.dmsansBold.font(baseSize: 40))
                                .foregroundColor(.black)
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading, 28)
                        .padding(.bottom, 5)
                        
                        // Description Text: Explore all exciting job roles
                        VStack {
                            Text("Explore all the most exciting job roles based on your interest and study major.")
                                .font(Font.custom("DMSans-Regular", size: 15))
                                .foregroundColor(Color("textcolor2"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading, 29)
                        
                        // Button: Next Arrow in a Circle
                        VStack {
                            NavigationLink(destination: LoginView(), isActive: $isNavigateToUploadView) {
                                Button(action: {
                                    print("Button tapped!")
                                    isNavigateToUploadView = true 
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(Color("bgColor"))
                                            .frame(width: 60, height: 60)
                                        
                                        Image("nextArrow")
                                            .frame(width: 23, height: 26)
                                    }
                                }
                                .padding(.trailing, 20)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding()
                }
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
