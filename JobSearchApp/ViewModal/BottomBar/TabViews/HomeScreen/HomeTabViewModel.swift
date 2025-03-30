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
    @Published var jobs: [Job] = [
        
        Job(companyName: "Google Inc",
            userRole: "HR Manager", // Replace with an appropriate user role
            companyImageName: "appleIcon",
            location: "California, USA",
            salary: "$15K / Mo",
            tags: ["Product Design", "UX", "UI"], // Sample tags
            timeAgo: "2 days ago", // Sample time ago
            experienceLevel: "Senior designer",
            jobType: "Full Time",
            jobTitle: "Product Designer", bgcolor: AppColors.translucentGold),

        Job(companyName: "Microsoft",
            userRole: "Engineering Lead", // Replace with an appropriate user role
            companyImageName: "microsoftIcon",
            location: "Redmond, WA",
            salary: "$18K / Mo",
            tags: ["Software Engineering", "C++", "Cloud"], // Sample tags
            timeAgo: "1 week ago", // Sample time ago
            experienceLevel: "Mid-Level",
            jobType: "Full Time",
            jobTitle: "Software Engineer", bgcolor: AppColors.translucentRaspberry),

        Job(companyName: "Tesla",
            userRole: "Recruiting Specialist", // Replace with an appropriate user role
            companyImageName: "teslaIcon",
            location: "Austin, TX",
            salary: "$20K / Mo",
            tags: ["Data Science", "AI", "Machine Learning"], // Sample tags
            timeAgo: "3 days ago", // Sample time ago
            experienceLevel: "Senior",
            jobType: "Contract",
            jobTitle: "Data Scientist",bgcolor: AppColors.mutedLavender),

        Job(companyName: "Amazon",
            userRole: "Hiring Manager", // Replace with an appropriate user role
            companyImageName: "amazonIcon",
            location: "Seattle, WA",
            salary: "$16K / Mo",
            tags: ["UX Design", "UI Design", "Research"], // Sample tags
            timeAgo: "5 days ago", // Sample time ago
            experienceLevel: "Junior",
            jobType: "Full Time",
            jobTitle: "UX Designer",bgcolor: AppColors.skyBlue)
    ]
}

