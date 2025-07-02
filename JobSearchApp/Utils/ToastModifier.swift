//
//  ToastModifier.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 26/06/25.
//
import SwiftUI
import UIKit

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isShowing {
                VStack {
                    Spacer()
                    ToastView(message: message)
                        .padding(.bottom, 30)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .onAppear {
                    // Start a timer to hide the toast
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
        }
    }
}

struct ToastView: View {
    var message: String
    
    var body: some View {
        HStack(spacing: 12) {
           
            ImageProvider.getImage(named: "companyImageName").map{ image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 32)
            }
            
            Text(message)
                .font(.system(size: 14, weight: .semibold))
        }
        .foregroundColor(AppColors.redColor)
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(AppColors.redColor)
        .clipShape(Capsule())
        .shadow(color: AppColors.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

