//
//  SaveJobDetailPage.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import SwiftUI



import SwiftUI

struct SaveJobDetailPage: View {
    let job: Jobs
    
    var body: some View {
        ScrollView { // Use ScrollView for longer content
            VStack(alignment: .leading, spacing: 15) {
                Image(job.companyImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom)
                
                Text(job.companyName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(job.userRole)
                    .font(.headline)
                    .foregroundColor(.secondary) //Use .secondary for a softer more subtle color
                
                Text("Location:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(job.location)
                    .font(.body)
                
                Text("Salary:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(job.salary)
                    .font(.body)
                
                Text("Tags:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    ForEach(job.tags, id: \.self) { tag in
                        TagView(tag: tag) // Reuse your TagView
                    }
                }
                
                Text("Posted:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(job.timeAgo)
                    .font(.body)
                
                
                Spacer() // Push content to the top
            }
            // .padding()
        }
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
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
    SaveJobDetailPage(job: job)
}
