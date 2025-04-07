//
//  PostTabView.swift
//  JobSearchApp
//
//  Created by DarkMoon on 06/04/25.
//

import SwiftUI

struct PostTabView: View {
    
    @ObservedObject var viewModel: BottomNavigationBarViewModel

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(radius: 5)
                        .overlay {
                            VStack {
                                Capsule()
                                    .fill(AppColors.deepBlue)
                                    .frame(width: 40, height: 5)
                                    .padding(.top, 10)
                                Text("What would you like to add?")
                                    .font(FontStyle.dmsansBold.font(baseSize: 16))
                                    .foregroundColor(AppColors.darkIndigoColor)
                                    .padding(.top)
                                
                                Text("Would you like to post your tips and experiences or create a job?")
                                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                    .foregroundColor(AppColors.dustyLavender)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                Button(action: {
                                    print("Login tapped")
                                }) {
                                    Text("POST")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(AppColors.deepBlue)
                                        .cornerRadius(10)
                                }
                                .padding(.top)
                                Button(action: {
                                    print("Login tapped")
                                }) {
                                    Text("MAKE A JOB")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(AppColors.pastelLavender)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 5)
                                Spacer()
                            }
                            .padding()
                        }
                        .transition(.move(edge: .bottom))
                        .edgesIgnoringSafeArea(.bottom)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .position(x: geometry.size.width / 2, y: geometry.size.height*1.125)
                .offset(y: viewModel.showBottomSheet ?   0 : geometry.size.height )
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
            .background(viewModel.showBottomSheet ? Color.black.opacity(0.6) : Color.clear  )
           
            .animation(.easeInOut(duration: 0.7), value: viewModel.showBottomSheet)
            .onTapGesture {
                if viewModel.showBottomSheet {
                    withAnimation {
                    // viewModel.showBottomSheet = false
                    }
                }
            }
           
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    PostTabView(viewModel:  BottomNavigationBarViewModel())
}
