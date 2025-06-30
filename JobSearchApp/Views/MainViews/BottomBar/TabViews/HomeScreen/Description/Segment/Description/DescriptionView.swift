//
//  DescriptionView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 05/03/25.
//

import SwiftUI

enum SelectedSegment{
    case jobDescription
    case aboutCompany
}

@available(iOS 16.0, *)
struct DescriptionView: View {
    let job: Jobs
    
    @StateObject private var viewModal = UploadCVViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedSegment: SelectedSegment = .jobDescription
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.offWhite.edgesIgnoringSafeArea(.all)
                VStack {
                    
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            ImageProvider.getImage(named: "BackArrow").map{ image in
                                Image(uiImage: image)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    ScrollView{
                        VStack(spacing: 5) {
                            HeaderView(job: job)
                            SegmentView(job: job, selectedSegment: $selectedSegment)
                            Group {
                                segmentView(for: selectedSegment, job: job)
                            }
                            
                        }
                        .padding(.horizontal,20)
                        
                    }
                    .background(AppColors.offWhite)
                    .scrollIndicators(.hidden)
                    
                    ApplyButton(job:job)
                    
                }
            }
        }        .navigationBarBackButtonHidden(true)
        
    }
    
}

struct HeaderView: View {
    let job: Jobs
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack {
                ImageProvider.getImage(named: job.companyImageName).map{ image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .padding(.bottom, 40)
                        .offset(y: 40)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(AppColors.offWhite)
            .padding(.bottom, 0)
            
            
            VStack(spacing: 14) {
                Text(job.jobTitle)
                    .font(FontStyle.dmsansBold.font(baseSize: 14))
                    .foregroundColor(AppColors.deepIndigo)
                    .lineLimit(1)
                
                HStack(spacing: 15) {
                    Text(job.companyName)
                        .font(FontStyle.dmsansRegular.font(baseSize: 13))
                        .foregroundColor(AppColors.deepIndigo)
                    Image(systemName: "circle.fill")
                        .font(FontStyle.dmsansRegular.font(baseSize: 5))
                        .foregroundColor(AppColors.deepIndigo)
                    Text(job.location)
                        .font(FontStyle.dmsansRegular.font(baseSize: 13))
                        .foregroundColor(AppColors.deepIndigo)
                    Image(systemName: "circle.fill")
                        .font(FontStyle.dmsansRegular.font(baseSize: 5))
                        .foregroundColor(AppColors.deepIndigo)
                    
                    Text(job.timeAgo)
                        .font(FontStyle.dmsansRegular.font(baseSize: 13))
                        .foregroundColor(AppColors.deepIndigo)
                }
                .lineLimit(1)
            }
            
            .frame(maxWidth: .infinity)
            .background(AppColors.whisperGray)
            .padding(.vertical, 32)
        }
        .frame(maxWidth: .infinity)
        .background(AppColors.whisperGray)
        
    }
}

@available(iOS 16.0, *)
struct ApplyButton: View {
    let job:Jobs
    @State private var isNavigateToSuccessUploadView :Bool = false
    var body: some View {
        VStack {
            HStack {
                // Circle with Image
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .cornerRadius(30)
                    ImageProvider.getImage(named: "Save").map{ image in
                        Image(uiImage: image)
                            .frame(width: 16, height: 21)
                        
                    }
                }
                
                NavigationLink(destination:  UploadCVView(job: job)
                               , isActive: $isNavigateToSuccessUploadView){
                    Button(action: {
                        isNavigateToSuccessUploadView = true
                    }) {
                        Text("APPLY NOW")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColors.blueColor)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 15)
                }
            }
            
            
        }
        .padding(.horizontal, 15)
        .background(AppColors.paleGray)
        
    }
}


#Preview {
    if #available(iOS 16.0, *) {
        let job = Jobs(companyName: "Google Inc",
                       userRole: "HR Manager",
                       companyImageName: "appleIcon",
                       location: "California, USA",
                       salary: "$15K / Mo",
                       tags: ["Product Design", "UX", "UI"],
                       timeAgo: "2 days ago",
                       experienceLevel: "Senior designer",
                       jobType: "Full Time",
                       jobTitle: "Product Designer",bgcolor: AppColors.orangeColor, jobDescription: "String", requirements: [
                        "Sed ut perspiciatis unde omnis iste natus error sit.",
                        "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.",
                        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
                        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur."
                       ],
                       facilities :[
                        "Medical",
                        "Dental",
                        "Technical Certification",
                        "Meal Allowance",
                        "Transport Allowance",
                        "Regular Hours",
                        "Mondays-Fridays"
                       ]
        )
        DescriptionView(job: job)
    } else {
        // Fallback on earlier versions
    }
}
