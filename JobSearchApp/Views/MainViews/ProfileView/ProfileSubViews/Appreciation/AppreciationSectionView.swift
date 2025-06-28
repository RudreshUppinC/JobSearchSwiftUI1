//
//  AppreciationSectionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 26/06/25.
//

import SwiftUI
import Combine


struct AppreciationSectionView: View {
    let appreciations:[Appreciation]
    let onAdd: () -> Void
    let onEditAppreciation: (Appreciation) -> Void
        let title: String = "Appreciation"

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                
                ImageProvider.getImage(named: "appreciation").map{
                    image in
                    Image(uiImage: image)
                        .scaledToFit()
                        .frame(width:24, height:24)
                }
                .padding(.trailing,8)
                
                Text(title)
                    .font(FontStyle.dmsansBold .font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    ImageProvider.getImage(named: "add").map { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:24,height:24)
                    }
                }
            }
            
            
            // --- Divider ---
            VStack{
                Divider()
                    .background(AppColors.dividerColor)
            }
            .padding(.vertical,15)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(appreciations) { item in
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.darkIndigoColor)
                                .padding(.bottom, 2)
                            
                            Text(item.issuer)
                                .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                .foregroundColor(AppColors.dustyLavender)
                            
                            Text(Formatters.monthYear.string(from: item.date))
                                .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                .foregroundColor(AppColors.dustyLavender.opacity(0.8))
                                .padding(.top, 4)
                        }
                        
                        Spacer()
                        
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

                }
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }
}

