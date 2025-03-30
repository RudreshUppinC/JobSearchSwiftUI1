//
//  Job.swift
//  JobSearchApp
//
//  Created by DarkMoon on 30/03/25.
//

import Foundation
import UIKit
import SwiftUICore

struct Job: Identifiable {
    let id = UUID()
    let companyName: String
    let userRole: String
    let companyImageName: String
    let location: String
    let salary: String
    let tags: [String]
    let timeAgo: String
    let experienceLevel: String
    let jobType: String
    let jobTitle: String
    let bgcolor: Color

}

