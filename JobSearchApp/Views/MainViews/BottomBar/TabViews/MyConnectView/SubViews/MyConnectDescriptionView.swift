//
//  MyConnectDescriptionView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 17/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct MyConnectDescriptionView: View {
    let job :Jobs
    @StateObject var viemodel =  MyConnectDescriptionViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.offWhite.edgesIgnoringSafeArea(.all)
                VStack {
                    
                    HStack {
                        Button(action: {
                            // presentationMode.wrappedValue.dismiss()
                        }){
                            ImageProvider.getImage(named: "BackArrow").map{ image in
                                Image(uiImage: image)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    HeaderView(job: job)
                    
                    ScrollView{
                        HStack{
                            
                            ForEach(SegmentedOption.allCases, id:  \.self) { option in
                                Button(action:{
                                    viemodel.selected = option
                                }) {
                                    Text(option.rawValue)
                                        .font(.headline)
                                        .foregroundColor(viemodel.selected == option ? .black: .red)
                                        .padding(.vertical, 8)
                                        .frame(maxWidth:.infinity)
                                        .background(viemodel.selected == option ? Color.orange.opacity(0.8) : Color.clear)
                                        .cornerRadius(9)
                                }
                                
                            }
                        }
                        
                        switch viemodel.selected{
                        case .aboutUs:
                            AboutUsView()
                        case .jobs:
                            JobsListView()
                        case .post:
                            PostView()
                        }
                        
                    }
                    
                    
                }
            }
        }        .navigationBarBackButtonHidden(true)
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
                       jobTitle: "Product Designer",bgcolor: AppColors.orangeColor, jobDescription:
                        "", requirements: [
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
        MyConnectDescriptionView(job:job)
    } else {
        // Fallback on earlier versions
    }
}
