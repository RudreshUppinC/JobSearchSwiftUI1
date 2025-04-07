//
//  HomeTabViewModel.swift
//  JobSearchApp
//
//  Created by DarkMoon on 30/03/25.
//

import Foundation
import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    @Published var isNavigateSeeMoreJobs:Bool = false
    @Published var jobs: [Job] = [
       
        Job(companyName: "Google Inc",
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

        Job(companyName: "Dribbble Inc",
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

        Job(companyName: "Twitter Inc",
            userRole: "Recruiting Specialist",
            companyImageName: "twitterIcon",
            location: "Austin, TX",
            salary: "$20K / Mo",
            tags: ["Data Science", "AI", "Machine Learning"],
            timeAgo: "3 days ago",
            experienceLevel: "Senior",
            jobType: "Contract",
            jobTitle: "Data Scientist",bgcolor: AppColors.skyBlueTwitter),

        Job(companyName: "Facebook Inc",
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
    
        
        Job(companyName: "Microsoft Inc",
            userRole: "Hiring Manager",
            companyImageName: "microsoftIcon",
            location: "Seattle, WA",
            salary: "$16K / Mo",
            tags: ["UX Design", "UI Design", "Research"],
            timeAgo: "5 days ago",
            experienceLevel: "Junior",
            jobType: "Full Time",
            jobTitle: "Azure Developer",bgcolor: AppColors.skyBlueMicrosoft),
        
        Job(companyName: "Apple Inc",
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

