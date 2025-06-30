//
//  AboutCompanyView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 02/05/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct AboutCompanyView: View {
    let job: Jobs
    @State private var isExpanded: Bool = false
    private let collapsedLineLimit = 3
    
    @State private var allCompanyImages = [
        "companyimg1",
        "companyimg1",
        "companyimg1",
        "companyimg1",
        "companyimg1",
        "companyimg1",
    ]
    
    private let imagePreviewWidth: CGFloat = 180
    private let imagePreviewHeight: CGFloat = 120
    private let cornerRadius: CGFloat = 12
    
    private var firstImageName: String? {
        allCompanyImages[safe: 0]
    }
    private var secondImageName: String? {
        allCompanyImages[safe: 1]
    }
    
    private var remainingImageCount: Int {
        max(0, allCompanyImages.count - 2)
    }
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            
            Text("About Company")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,10)
                .padding(.top, 10)
            
            Text(job.jobDescription)
                .font(FontStyle.dmsansBold.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
                .padding(.bottom,5)
                .lineLimit(isExpanded ? nil :collapsedLineLimit)
            
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
            
            Text("Website")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("https://www.google.com")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
            
            Text("Industry")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("Internet Product")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
                        
            Text("Employee size")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("132,121 Employees")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
            
            Text("Head Office")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("Mountain View, California, Amerika Serikat")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
            
            Text("Type")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("Multinational company")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
            
            Text("Since")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("1998")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
            
            
            Text("Specialization")
                .font(FontStyle.dmsansBold.font(baseSize: 13))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            Text("Search technology, Web computing, Software and Online advertising")
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .foregroundColor(AppColors.dustyLavender)
            
            Text("Company Gallary")
                .font(FontStyle.dmsansBold.font(baseSize: 11))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,5)
            
            
            HStack(spacing: 15) {
                
                if let img1 = firstImageName {
                    NavigationLink {
                        ImageCarouselView(
                            allImageNames: allCompanyImages,
                            initialImageName: img1
                        )
                    } label: {
                        Image(img1)
                            .resizable()
                            .scaledToFill()
                            .frame(width: (UIScreen.main.bounds.width - 55) / 2, height: imagePreviewHeight)
                            .cornerRadius(cornerRadius)
                            .clipped()
                    }
                    .buttonStyle(.plain)
                }
                
                if let img2 = secondImageName {
                    NavigationLink {
                        ImageCarouselView(
                            allImageNames: allCompanyImages,
                            initialImageName: img2
                        )
                    } label: {
                        ZStack {
                            Image(img2)
                                .resizable()
                                .scaledToFill()
                                .frame(width: (UIScreen.main.bounds.width - 55) / 2, height: imagePreviewHeight)
                                .cornerRadius(cornerRadius)
                                .clipped()
                            
                            if remainingImageCount > 0 {
                                
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .fill(.black.opacity(0.5))
                                
                                Text("+\(remainingImageCount) pictures")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    
                }
                
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            
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
    
    if #available(iOS 16.0, *) {
        AboutCompanyView(job: job)
    } else {
        // Fallback on earlier versions
    }
}
