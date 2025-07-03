//
//  ChatScreenView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct ChatTabView: View {
    @ObservedObject  var mainScreenViewModel : MainScreenViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.whisperGray
                    .ignoresSafeArea(.all)
                
                ScrollView{
                    
                    // Main Content
                    VStack {
                        
                        ImageProvider.getImage(named: "noChatImage").map{ image in
                            Image(uiImage: image)
                                .scaledToFit()
                                .frame(width: 250,height: 240)
                               // .padding(.top, 150)
                            
                        }
                        Text("No Message")
                            .font(FontStyle.dmsansBold.font(baseSize: 20))
                            .foregroundColor(AppColors.darkIndigoColor)
                            .padding(.bottom,5)
                            .padding(.top, 30)
                        Text("You currently have no incoming messages thank you")
                            .font(FontStyle.dmsansRegular.font(baseSize: 12))
                            .foregroundColor(AppColors.dustyLavender)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Spacer()
                        Button(action: {
                            print("Login tapped")
                        }) {
                            Text("CREATE A MESSAGE")
                                .font(FontStyle.dmsansBold.font(baseSize: 14))
                                .foregroundColor(AppColors.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(AppColors.deepBlue)
                                .cornerRadius(10)
                        }
                        .padding(.top,25)
                        .padding(.horizontal, 20)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.top, 10)
                .navigationBarBackButtonHidden(true)
                
            }

        }
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        ChatTabView(mainScreenViewModel: MainScreenViewModel())
    } else {
        // Fallback on earlier versions
    }
}
