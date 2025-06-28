//
//  LanguageSectionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 26/06/25.
//

import SwiftUI
import SwiftUI

// MARK: 1. Reusable Components

struct LanguagePillView: View {
    var languageName: String
    
    var body: some View {
        Text(languageName)
            .font(FontStyle.dmsansRegular.font(baseSize: 12))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(AppColors.mutatedLavender)
            .clipShape(Capsule())
            .foregroundColor(AppColors.dustyLavender)
    }
}


// MARK: 2. The Main Card View

@available(iOS 16.0, *)
struct LanguageSectionView: View {

    let onEdit: () -> Void
    let onAdd:() -> Void
    var languages: [Languages]
    let title: String = "Appreciation"
         
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: - Edit Profile Button
            HStack {
                ImageProvider.getImage(named: "language").map{
                    image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:24, height:24)
                }
                  .padding(.trailing,8)
                
                Text("Language")
                        .font(FontStyle.dmsansBold .font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor)
                    
                Spacer()
                Button(action: onEdit) {
                    ImageProvider.getImage(named: "add").map{
                        image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical,15)

            VStack{
                Divider()
                    .background(AppColors.dividerColor)
            }
            .padding(.horizontal,20)

            // MARK: - Language Tag

            FlowLayout(spacing: 10) {
                ForEach(languages) { item in
                    LanguagePillView(languageName: item.langName)
                }
            }
            .padding(.horizontal)
            .padding(.bottom,15)


        }
        .background(Color.white)
         .cornerRadius(12)

        
    }
}


