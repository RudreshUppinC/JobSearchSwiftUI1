//
//  EditProfileDetailPage.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 30/06/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct EditProfileDetailPage: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        // 1. ZStack is the main container for layering.
        ZStack {
            AppColors.paleGray
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Spacer()
                    Text("Coming Soon!!")
                        .font(FontStyle.dmsansBold.font(baseSize: 16))
                        .foregroundColor(AppColors.darkIndigoColor)

                }
            }
            .scrollIndicators(.hidden)
     
        }

        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    ImageProvider.getImage(named: "BackArrow").map{ image in
                        Image(uiImage: image)
                    }
                }
            }
        }
    }

}


