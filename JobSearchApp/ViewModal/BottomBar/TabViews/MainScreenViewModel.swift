//
//  MainScreenViewModel.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 30/04/25.
//

import Foundation

import Foundation
import Foundation
import SwiftUI

class MainScreenViewModel: ObservableObject {
    @Published var showBottomSheet: Bool = false
    @Published var isCenterPlusButton:Bool = false

    @Published var jobsData:[Jobs] = []

    init(){
        jobsData = loadJobsData()
    }
    
    private func loadJobsData() -> [Jobs] {

        return[
            
            Jobs(companyName: "Google Inc",
                 userRole: "HR Manager",
                 companyImageName: "googlelogo1",
                 location: "California, USA",
                 salary: "$15K / Mo",
                 tags: ["Product Design", "UX", "UI"],
                 timeAgo: "2 days ago",
                 experienceLevel: "Senior designer",
                 jobType: "Full Time",
                 jobTitle: "Product Designer",
                 bgcolor: AppColors.translucentGold),

            Jobs(companyName: "Dribbble Inc",
                 userRole: "Engineering Lead",
                 companyImageName: "dribbbleIcon",
                 location: "Redmond, WA",
                 salary: "$18K / Mo",
                 tags: ["Software Engineering", "C++", "Cloud"],
                 timeAgo: "1 week ago",
                 experienceLevel: "Mid-Level",
                 jobType: "Full Time",
                 jobTitle: "Software Engineer",
                 bgcolor: AppColors.translucentRaspberry),

            Jobs(companyName: "Twitter Inc",
                 userRole: "Recruiting Specialist",
                 companyImageName: "twitterIcon",
                 location: "Austin, TX",
                 salary: "$20K / Mo",
                 tags: ["Data Science", "AI", "Machine Learning"],
                 timeAgo: "3 days ago",
                 experienceLevel: "Senior",
                 jobType: "Contract",
                 jobTitle: "Data Scientist",bgcolor: AppColors.skyBlueTwitter),

            Jobs(companyName: "Facebook Inc",
                 userRole: "Hiring Manager",
                 companyImageName: "facebookIcon",
                 location: "Seattle, WA",
                 salary: "$16K / Mo",
                 tags: ["UX Design", "UI Design", "Research"],
                 timeAgo: "5 days ago",
                 experienceLevel: "Junior",
                 jobType: "Full Time",
                 jobTitle: "UX Designer",
                 bgcolor: AppColors.facebookColor),
         
             
            Jobs(companyName: "Microsoft Inc",
                 userRole: "Hiring Manager",
                 companyImageName: "microsoftIcon",
                 location: "Seattle, WA",
                 salary: "$16K / Mo",
                 tags: ["UX Design", "UI Design", "Research"],
                 timeAgo: "5 days ago",
                 experienceLevel: "Junior",
                 jobType: "Full Time",
                 jobTitle: "Azure Developer",bgcolor: AppColors.skyBlueMicrosoft),
             
            Jobs(companyName: "Apple Inc",
                 userRole: "Hiring Manager",
                 companyImageName: "appleIcon",
                 location: "Seattle, WA",
                 salary: "$16K / Mo",
                 tags: [ "AWS Design", "Research"],
                 timeAgo: "5 days ago",
                 experienceLevel: "Junior",
                 jobType: "Full Time",
                 jobTitle: "AWS Developer",bgcolor: AppColors.neutralGrayAppleColor)
        ]
    }
    

    
}

