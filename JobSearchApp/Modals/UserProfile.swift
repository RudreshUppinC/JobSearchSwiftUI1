//
//  UserProfile.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import Foundation
struct UserProfile: Identifiable {
    let id: UUID = UUID()
    var name: String
    var location: String
    var profileImageURL: URL?
    var followerCount: Int
    var followingCount: Int
    var aboutMe: String
    var workExperiences: [WorkExperience]
    var educations: [Education]
    var skills: [Skill]
    var languages: [Languages]
    var appreciation: [Appreciation]

    static var exampleLoaded: UserProfile {
        UserProfile(
            name: "Orlando Diggs",
            location: "Swift City, USA",
            profileImageURL: URL(string: "https://example.com/orlando.jpg"),
            followerCount: 12000,
            followingCount: 23000,
            aboutMe: "This is the fully loaded bio for Orlando Diggs. I enjoy coding in SwiftUI and long walks on the beach.",
            workExperiences: [
                WorkExperience(
                    jobTitle: "Senior iOS Developer",
                    companyName: "Innovatech Solutions Inc.",
                    startDate: UserProfile.createSampleDate(year: 2015, month: 1),
                    endDate: UserProfile.createSampleDate(year: 2015, month:60),
                ),
                WorkExperience(
                    jobTitle: "Lead SwiftUI Engineer",
                    companyName: "Future Systems Co.",
                    startDate:  UserProfile.createSampleDate(year: 2015, month: 1),
                    endDate: nil,
                )
                
            ],
            educations: [
                Education(
                    degreeOrField: "Bachelor of Science in Computer Science",
                    institutionName: "State University of Tech",
                    startDate: UserProfile.createSampleDate(year: 2015, month: 23),
                    endDate: UserProfile.createSampleDate(year: 2015, month: 31),
                    duration: "4 yrs" // You might want to calculate this dynamically
                )
            ],
            skills: [
                Skill(name: "SwiftUI"),
                Skill(name: "UIKit"),
                Skill(name: "Combine"),
                Skill(name: "Core Data"),
                Skill(name: "Git"),
                Skill(name: "Agile Methodologies")
                
            ],
            
            languages: [
                Languages(langName: "English"),
                Languages(langName: "German"),
                Languages(langName: "Spanish"),
                Languages(langName: "Italy"),
                Languages(langName: "Mandarin")
        
            ],
            
            appreciation: [
                Appreciation(
                    fieldname:"Wireless Symposium (RWS)",
                    jobTitle: "Young Scientist",
                    startDate: UserProfile.createSampleDate(year: 2014, month: 23),
                    endDate: UserProfile.createSampleDate(year: 2015, month: 31),
                )
            ]
        )
    }
    
    static func createSampleDate(year: Int, month: Int, day: Int = 1) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return Calendar.current.date(from: components)!
    }
}




struct WorkExperience: Identifiable,DatedExperience {
    let id: UUID = UUID()
    var jobTitle: String
    var companyName: String
    var startDate: Date
    var endDate: Date?
}

struct Education: Identifiable ,DatedExperience{
    
    let id: UUID = UUID()
    var degreeOrField: String
    var institutionName: String
    var startDate: Date
    var endDate: Date?
    var duration: String
}

struct Skill: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
}

struct Languages: Identifiable, Hashable {
    let id: UUID = UUID()
    var langName: String
}

struct Appreciation: Identifiable {
    
    let id: UUID = UUID()
    var fieldname: String
    var jobTitle: String
    var startDate: Date
    var endDate: Date?
}


extension DatedExperience {
    
    var formattedDateAndDuration: String {

        let formattedStartDate = Formatters.monthYear.string(from: startDate)
        
        let formattedEndDate = endDate != nil ? Formatters.monthYear.string(from: endDate!) : "Present"
        
        let durationString = calculateDuration()

        return "\(formattedStartDate) - \(formattedEndDate) • \(durationString)"
    }
    
    private func calculateDuration() -> String {
        let finalEndDate = endDate ?? Date()
        
        let components = Calendar.current.dateComponents([.year, .month], from: startDate, to: finalEndDate)
        
        guard let years = components.year, let months = components.month else {
            return ""
        }
        
        var parts: [String] = []
        if years > 0 {
            parts.append("\(years) \(years == 1 ? "yr" : "yrs")")
        }
        if months > 0 {
            parts.append("\(months) \(months == 1 ? "mo" : "mos")")
        }
        
        if parts.isEmpty {
            return "1 mo"
        }
        
        return parts.joined(separator: " ")
    }
}

protocol DatedExperience {
    var startDate: Date { get }
    var endDate: Date? { get }
}
