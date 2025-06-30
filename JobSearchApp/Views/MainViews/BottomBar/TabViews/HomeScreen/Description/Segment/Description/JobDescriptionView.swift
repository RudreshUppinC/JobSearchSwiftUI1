//
//  JobDescriptionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 02/05/25.
//

import SwiftUI
import MapKit

// MARK: - SegmentsView

struct JobDescriptionView: View {
    let job: Jobs
    @State private var isExpanded: Bool = false
    private let collapsedLineLimit = 3
    
    var body: some View {
        VStack(alignment: .leading,spacing: 5) {
            
            Text("Job Description")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,10)
                .padding(.top, 10)
            
            Text(job.jobDescription)
                .font(FontStyle.dmsansBold.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
                .lineLimit(isExpanded ? nil :collapsedLineLimit)
                .animation(.easeInOut(duration: 0.3), value: isExpanded)
                .padding(.bottom,5)
            
            Button{
                withAnimation(.easeInOut(duration: 0.3)){
                    isExpanded.toggle()
                }
            } label: {
                Text(isExpanded ? "Read Less":"Read More")
                    .font(FontStyle.dmsansBold.font(baseSize: 11))
                    .foregroundColor(.black)
            }
            .buttonStyle(.plain)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            
            .background(AppColors.pinkbutton).opacity(0.2)
            .cornerRadius(4)
            // Requirements
            RequirementsView(job: job)
            
            // Location
            LocationView()
            
            // Informations
            InformationsView()
            
            // Facilities and Others
            FacilitiesView(job: job)
        }
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
    
    JobDescriptionView(job: job)
}

// MARK: - Subviews


struct LocationView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7829, longitude: -74.1513), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 8)
            
            Text("Overlook Avenue, Bellville, NJ, USA.")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 4)
            
            Map(coordinateRegion: $region, interactionModes: [])
                .frame(height: 200)
                .cornerRadius(8)
        }
        
        .cornerRadius(8)
    }
}

struct InformationsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Informations")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 16)
            VStack(alignment:.leading) {
                Text("Position")
                    .font(FontStyle.dmsansBold.font(baseSize: 11))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
                
                Text("Senior Designer")
                    .font(FontStyle.dmsansRegular.font(baseSize: 11))
                    .foregroundColor(AppColors.dustyLavender)
                
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Qualification")
                    .font(FontStyle.dmsansBold.font(baseSize: 11))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
                
                Text("Bachelor's Degree")
                    .font(FontStyle.dmsansRegular.font(baseSize: 11))
                    .foregroundColor(AppColors.dustyLavender)
                
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Experience")
                    .font(FontStyle.dmsansBold.font(baseSize: 11))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
                
                Text("3 Years")
                    .font(FontStyle.dmsansRegular.font(baseSize: 11))
                    .foregroundColor(AppColors.dustyLavender)
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Job Type")
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
                
                Text("Full-Time")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Specialization")
                    .font(FontStyle.dmsansBold.font(baseSize: 11))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
                
                Text("Design")
                    .font(FontStyle.dmsansRegular.font(baseSize: 11))
                    .foregroundColor(AppColors.dustyLavender)
            }
            .padding(.bottom,15)
            
            Divider()
            
        }
        
        .cornerRadius(8)
    }
}

struct FacilitiesView: View {
    let job:Jobs
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Facilities and Others")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .padding(.bottom,16)
            
            ForEach(job.facilities, id: \.self) { facility in
                HStack(alignment: .top) {
                    Text("•")
                        .font(FontStyle.dmsansBold.font(baseSize: 11))
                        .foregroundColor(AppColors.darkIndigoColor)
                    Text(facility)
                        .font(FontStyle.dmsansRegular.font(baseSize: 11))
                        .foregroundColor(AppColors.dustyLavender)
                        .padding(.bottom,15)
                }
            }
            
        }
        
    }
}

struct RequirementsView: View {
    let job:Jobs
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Requirements")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,10)
            
            ForEach(job.requirements, id: \.self) { data in
                HStack(alignment: .top,spacing: 11) {
                    Text("•")
                    Text(data)
                        .font(FontStyle.dmsansRegular.font(baseSize: 11))
                        .foregroundColor(AppColors.dustyLavender)
                }
                .padding(.bottom, 5)
            }
        }
    }
}
