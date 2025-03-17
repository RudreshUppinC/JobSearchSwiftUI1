//
//  MyConnectViewModel.swift
//  JobSearchApp
//
//  Created by Way2 on 17/03/25.
//

import Foundation

class MyConnectViewModel :ObservableObject {
    
    @Published var companies: [Company] = [
         Company(name: "Google Inc", imageName: "googlelogo1", followerCount: "1M Followers"),
         Company(name: "Dribbble Inc", imageName: "dribbbleIcon", followerCount: "1M Followers"),
         Company(name: "Twitter Inc", imageName: "twitterIcon", followerCount: "1M Followers"),
         Company(name: "Apple Inc", imageName: "appleIcon", followerCount: "1M Followers"),
         Company(name: "Facebook Inc", imageName: "facebookIcon", followerCount: "1M Followers"),
         Company(name: "Microsoft Inc", imageName: "microsoftIcon", followerCount: "1M Followers"),
         
         Company(name: "Google Inc1", imageName: "googlelogo1", followerCount: "1M Followers1"),
         Company(name: "Dribbble In1c", imageName: "dribbbleIcon", followerCount: "1M Followers"),
         Company(name: "Twitter Inc1", imageName: "twitterIcon", followerCount: "1M Followers"),
         Company(name: "Apple Inc1", imageName: "appleIcon", followerCount: "1M Followers"),
         Company(name: "Facebook Inc1", imageName: "facebookIcon", followerCount: "1M Followers"),
         Company(name: "Microsoft Inc1", imageName: "microsoftIcon", followerCount: "1M Followers")
     ]
    
    func followCompany(company:Company){
        print("company(\(companies.count)")
    }
}
