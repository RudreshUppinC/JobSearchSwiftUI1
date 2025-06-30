//
//  ResumeCardSection.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 26/06/25.
//

import SwiftUI

struct ResumeCardView: View {
    let onAdd: () -> Void
    let onDelete: (Resume) -> Void
    let onEdit: () -> Void
    
    var resumes: [Resume]
    let title: String = "Resume"
    
    var body: some View {
        
        VStack(spacing: 0) {
            // --- Header Section ---
            HStack {
                ImageProvider.getImage(named: "resume").map{
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
                
                Button(action:onEdit){
                    ImageProvider.getImage(named: "add").map{ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            
            // --- List of Resumes ---
            VStack{
                Divider()
                    .background(AppColors.dividerColor)
            }
            .padding(.vertical,20)
            .padding(.horizontal)
            
            HStack(spacing: 12) {
                // --- File Type Icon ---
                Button(action:onEdit){
                    ImageProvider.getImage(named: "PDF").map{ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                    }
                }
                
                // --- File Info ---
                VStack(alignment: .leading, spacing: 4) {
                    Text(resumes.prefix(1).first?.fileName ?? "")
                        .font(FontStyle.dmsansBold.font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor).opacity(0.9)
                    Text("\(String(format: "%.0f",resumes.prefix(1).first?.fileSizeInKB ?? "")) Kb • \( resumes.prefix(1).first?.uploadDate.formattedForResumeUpload() ?? "")")
                        .font(FontStyle.dmsansRegular.font(baseSize: 10))
                        .foregroundColor(AppColors.slatePurpleColor)
                }
                
                Spacer()
                
                // --- Delete Button ---
                Button(action: onEdit) {
                    Image(systemName: "trash")
                        .font(.title2)
                        .foregroundColor(.red)
                }
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }
}


