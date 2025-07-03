//
//  BookmarkScreenView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct BookMarkTabView: View {
    @ObservedObject  var mainScreenViewModel : MainScreenViewModel
    
    @ObservedObject  var recentJobListViewModel : RecentJobsListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.paleGray
                    .ignoresSafeArea(.all)
                ScrollView {
                    LazyVStack {
                        ForEach($recentJobListViewModel.jobsData) { $job in
                            ZStack {
                                NavigationLink(destination: SaveJobDetailPage(job: job)) {
                                }
                                .opacity(0.0)
                                JobRow(job: job)
                                    .padding(.bottom, 8)
                                    .background(Color.clear)
                                    .frame(height: 205)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.top,105)
                .ignoresSafeArea(.all)
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Delete all") {
                            withAnimation {
                                mainScreenViewModel.showBottomSheet = false
                            }
                        }
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(AppColors.orangeColor)
                    }
                    
                    ToolbarItem(placement: .principal){
                        Text("Saved Job")
                            .font(FontStyle.dmsansRegular.font(baseSize: 17))
                            .foregroundColor(AppColors.deepIndigo)
                    }
                }
                .background(AppColors.paleGray)
                .toolbarBackground(
                    AppColors.paleGray,
                    for:.navigationBar
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct JobRow: View {
    let job: Jobs
    
    var body: some View {
        ZStack {
            
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    ZStack {
                        Circle()
                            .fill(job.bgcolor)
                        ImageProvider.getImage(named: job.companyImageName).map{ image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 32)
                        }
                    }
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    
                    Spacer()
                    Button(action: {
                        print("More options tapped")
                    }) {
                        
                        ImageProvider.getImage(named: "more").map{ image in
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text(job.userRole)
                            .font(FontStyle.dmsansBold.font(baseSize: 13))
                            .foregroundColor(AppColors.vulcanColor)
                        
                        Text("\(job.companyName) - \(job.location)")
                            .font(FontStyle.dmsansRegular.font(baseSize: 11))
                            .foregroundColor(AppColors.dustyLavender)
                    }
                    
                    
                    HStack {
                        ForEach(job.tags, id: \.self) { tag in
                            TagView(tag: tag)
                        }
                        Spacer()
                    }
                    .padding(.top,15)
                    
                    HStack {
                        Text(job.timeAgo)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .foregroundColor(AppColors.paleLavender)
                        
                        Spacer()
                        
                        salaryTextView()
                    }
                }
                
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical,5)
        
        
    }
    @ViewBuilder
    func salaryTextView() -> some View {
        let parts = job.salary.components(separatedBy: " / ")
        let amount  = parts.first ?? job.salary
        let period = parts.count > 1 ? " / " + parts[1] : ""
        
        Text(amount)
            .font(FontStyle.dmsansBold.font(baseSize: 14))
            .foregroundColor(AppColors.darkIndigoColor)
        +
        Text(period)
            .font(FontStyle.dmsansRegular.font(baseSize: 12))
            .foregroundColor(AppColors.paleLavender)
    }
    
}


struct TagView: View {
    let tag: String
    
    var body: some View {
        Text(tag)
            .font(FontStyle.dmsansRegular.font(baseSize: 10))
            .padding(.horizontal, 15)
            .padding(.vertical, 4)
            .background(AppColors.mutatedLavender)
            .foregroundColor(AppColors.dustyLavender)
            .clipShape(Capsule())
    }
}


#Preview {
    if #available(iOS 16.0, *) {
        BookMarkTabView(mainScreenViewModel: MainScreenViewModel(), recentJobListViewModel: RecentJobsListViewModel())
    } else {
        // Fallback on earlier versions
    }
}
