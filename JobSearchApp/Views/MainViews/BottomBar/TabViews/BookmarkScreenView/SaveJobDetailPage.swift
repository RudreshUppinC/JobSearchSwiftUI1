//
//  SaveJobDetailPage.swift
//  JobSearchApp
//
//  Created by Way2 on 27/03/25.
//

import SwiftUI



import SwiftUI

struct SaveJobDetailPage: View {
    let job: Job

    var body: some View {
        ScrollView { // Use ScrollView for longer content
            VStack(alignment: .leading, spacing: 15) { // Alignment for left-aligned text and spacing between elements
                Image(job.companyImageName)
                    .resizable()
                    .scaledToFit()  // Use scaledToFit instead of fixed frame
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
            .padding() // Add padding around the whole content
        }
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
       let job = Job(companyName: "Google Inc",
                    userRole: "HR Manager",
                    companyImageName: "appleIcon",
                    location: "California, USA",
                    salary: "$15K / Mo",
                    tags: ["Product Design", "UX", "UI"],
                    timeAgo: "2 days ago",
                    experienceLevel: "Senior designer",
                    jobType: "Full Time",
                    jobTitle: "Product Designer",bgcolor: AppColors.orangeColor)
     SaveJobDetailPage(job: job)
}
