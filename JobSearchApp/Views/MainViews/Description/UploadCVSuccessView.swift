//
//  UploadCVSuccessView.swift
//  JobSearchApp
//
//  Created by Way2 on 05/03/25.
//

import SwiftUI

struct UploadCVSuccessView: View {
    @ObservedObject var viewModal: UploadCVViewModel

    var body: some View {
        
        VStack {
            // Uploaded File Info
            VStack {
                HStack {
                    Image("PDF")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(viewModal.cvFileName)
                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                            .lineLimit(1)
                        Text("\(viewModal.cvFileSize) - \(viewModal.cvUploadDate)")
                            .font(FontStyle.dmsansBold.font(baseSize: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color("slightPink"))
            }
            .padding(.vertical, 30)
            .cornerRadius(8) // Add corner radius for a cleaner look. Optional.
            
            // Success Content
            VStack(spacing: 20) {
                Image("success1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("Upload Successful!")
                    .font(FontStyle.dmsansBold.font(baseSize: 16))
                    .foregroundColor(AppColors.texColor14)
                
                Text("Congratulations, your application has been sent")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.texColor14)
                    .multilineTextAlignment(.center) // Center the multiline text
                
                Button {
                    // Action for "Find a similar job"
                } label: {
                    Text("FIND A SIMILAR JOB")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                        .foregroundColor(AppColors.texColor12)
                }
                .background(AppColors.lightPink1)
                .cornerRadius(8)
                
                Button {
                    viewModal.isUploadFileScreen = false
                    viewModal.hasCVUploaded = false
                } label: {
                    Text("BACK TO HOME")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                        .foregroundColor(.white)
                }
                .background(AppColors.texColor12)
                .cornerRadius(8)
            }
            .padding(20) // Consistent padding for the success content
            .frame(maxWidth: .infinity) // Ensure VStack takes up full width
            
            Spacer() // Push content to the top
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

#Preview {
    UploadCVSuccessView(viewModal: UploadCVViewModel())
}
