//
//  JobSearchAppApp.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import SwiftUI

@available(iOS 16.0, *)
@main
struct JobSearchApp: App {

    var body: some Scene {
        WindowGroup {
           SplashView()
            //HomeTabView(mainScreenViewModel: MainScreenViewModel(), recentJobListViewModel: RecentJobsListViewModel())
           // RecentJobsListView(mainScreenViewModel: MainScreenViewModel())
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

         //   DescriptionView(job: job)
        }

    }
}
