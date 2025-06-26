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
    let languageName: String
    
    var body: some View {
        Text(languageName)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.black) // Your text color
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.15)) // Your pill color
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


// MARK: 2. The Main Card View

struct LanguageSectionView: View {
    // Pass in the data this view needs
    let languages: [String]
    let onEdit: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Button(action: {

                }) {
                    ImageProvider.getImage(named: "add").map { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:24,height:24)
                    }
                }
                .padding(.trailing,8)
              
                              
                  Text("Language")
                      .font(FontStyle.dmsansBold .font(baseSize: 12))
                      .foregroundColor(AppColors.darkIndigoColor)
                
            
                
                Button(action: {

                }) {
                    ImageProvider.getImage(named: "editOrange").map { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:24,height:24)
                    }
                }

            }
            .padding(.bottom, 12)
            
            VStack{
                Divider()
                    .background(AppColors.dividerColor)
            }
            .padding(.top,20)
            .padding(.horizontal,20)
         

        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }
}


struct LanguageExampleView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSectionView(languages: [""], onEdit: {})
    }
}
