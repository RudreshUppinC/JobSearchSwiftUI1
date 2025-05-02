//
//  SegmentView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 02/05/25.
//

import SwiftUI



struct SegmentView: View {
    let job: Jobs
    @Binding var selectedSegment: SelectedSegment
    
    private let selectedBackgroundColor = AppColors.blueColor
    private let selectedForegroundColor = AppColors.white
    private let deselectedBackgroundColor = AppColors.pastelLavender
    private let deselectedForegroundColor = AppColors.deepIndigo
    
    
    var body: some View {
        
        HStack(spacing: 10) {
            Button(action: {
                selectedSegment = .jobDescription
            }) {
                Text("Description")
                    .font(FontStyle.dmsansBold.font(baseSize: 13))
                    .foregroundColor(selectedSegment == .jobDescription ?selectedForegroundColor : deselectedForegroundColor )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .background(selectedSegment == .jobDescription ? selectedBackgroundColor : deselectedBackgroundColor)
                    .cornerRadius(8)
            }
            .padding(.leading,10)
            
            Button(action: {
                selectedSegment = .aboutCompany
            }) {
                Text("Company")
                    .font(FontStyle.dmsansBold.font(baseSize: 13))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .foregroundColor(selectedSegment == .aboutCompany ?selectedForegroundColor : deselectedForegroundColor )
                    .background(selectedSegment == .aboutCompany ? selectedBackgroundColor : deselectedBackgroundColor)
                    .cornerRadius(8)
            }
            .padding(.trailing,10)
            
        }
        .frame(height: 40)
        
    }
}

@available(iOS 16.0, *)
@ViewBuilder
func segmentView(for selectedSegment: SelectedSegment, job: Jobs) -> some View {
    switch selectedSegment {
    case .jobDescription:
        JobDescriptionView(job: job).id(SelectedSegment.jobDescription)
    case .aboutCompany:
        AboutCompanyView(job: job).id(SelectedSegment.aboutCompany)
    }
}

#Preview {
    let job = Jobs(companyName: "Google Inc",
                 userRole: "HR Manager",
                 companyImageName: "appleIcon",
                 location: "California, USA",
                 salary: "$15K / Mo",
                 tags: ["Product Design", "UX", "UI"],
                 timeAgo: "2 days ago",
                 experienceLevel: "Senior designer",
                 jobType: "Full Time",
                   jobTitle: "Product Designer",bgcolor: AppColors.orangeColor, jobDescription: "", requirements:  [
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
    
    @State var selectedSegment: SelectedSegment = .aboutCompany
    SegmentView(job: job, selectedSegment: $selectedSegment)
}
