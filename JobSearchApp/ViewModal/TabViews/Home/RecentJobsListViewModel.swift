//
//  RecentJobsListViewModel.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 01/05/25.
//

import Foundation
import Combine
import SwiftUI

class RecentJobsListViewModel: ObservableObject {
    
    @Published var jobsData:[Jobs] = []
    @Published var selectedJobIndex: Int?
    
    init(){
        jobsData = loadJobsData()
    }
    
    func selectedJob(at index: Int) {
        selectedJobIndex = index
        if index > 0, index < jobsData.count{
            let job = jobsData[index]
            print("selectedIndex: \(index), jobName:\(job.companyName)")
        }
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
                 bgcolor: AppColors.translucentGold,
                 jobDescription: "Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem..Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...", requirements: [
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
                ),
            
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
                 bgcolor: AppColors.translucentRaspberry,
                 jobDescription: "Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem..Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...",
                 requirements: [
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
                ),
            
            Jobs(companyName: "Twitter Inc",
                 userRole: "Recruiting Specialist",
                 companyImageName: "twitterIcon",
                 location: "Austin, TX",
                 salary: "$20K / Mo",
                 tags: ["Data Science", "AI", "Machine Learning"],
                 timeAgo: "3 days ago",
                 experienceLevel: "Senior",
                 jobType: "Contract",
                 jobTitle: "Data Scientist",
                 bgcolor: AppColors.skyBlueTwitter,
                 jobDescription: "Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem..Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...",
                 requirements: [
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
                ),
            
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
                 bgcolor: AppColors.facebookColor,
                 jobDescription: "Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem..Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...",
                 requirements: [
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
                 
                ),
            
            
            Jobs(companyName: "Microsoft Inc",
                 userRole: "Hiring Manager",
                 companyImageName: "microsoftIcon",
                 location: "Seattle, WA",
                 salary: "$16K / Mo",
                 tags: ["UX Design", "UI Design", "Research"],
                 timeAgo: "5 days ago",
                 experienceLevel: "Junior",
                 jobType: "Full Time",
                 jobTitle: "Azure Developer",bgcolor: AppColors.skyBlueMicrosoft,
                 jobDescription: "Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem..Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...",
                 requirements: [
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
                ),
            
            Jobs(companyName: "Apple Inc",
                 userRole: "Hiring Manager",
                 companyImageName: "appleIcon",
                 location: "Seattle, WA",
                 salary: "$16K / Mo",
                 tags: [ "AWS Design", "Research"],
                 timeAgo: "5 days ago",
                 experienceLevel: "Junior",
                 jobType: "Full Time",
                 jobTitle: "AWS Developer",bgcolor: AppColors.neutralGrayAppleColor,
                 jobDescription: "Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem..Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...",
                 requirements: [
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
        ]
    }
      
}

