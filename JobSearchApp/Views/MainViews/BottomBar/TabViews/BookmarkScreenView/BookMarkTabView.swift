//
//  BookmarkScreenView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/03/25.
//

import SwiftUI

struct BookMarkTabView: View {
        @ObservedObject  var mainScreenViewModel : MainScreenViewModel
        //To get saved jobslist
        @ObservedObject  var recentJobListViewModel : RecentJobsListViewModel
    
    var body: some View {
        NavigationView {
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
                                .frame(height: 200)

                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(.systemGray6))
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
                Image(job.companyImageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.horizontal)
                

                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading) {
                        Text(job.userRole)
                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                            .foregroundColor(AppColors.vulcanColor)

                        Text("\(job.companyName) - \(job.location)")
                            .font(FontStyle.dmsansRegular.font(baseSize: 14))
                            .foregroundColor(AppColors.dustyLavender)
                    }
                    
                    Spacer()
                    Button(action: {
                        print("More options tapped")
                    }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    ForEach(job.tags, id: \.self) { tag in
                        TagView(tag: tag)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top,15)

                HStack {
                    Text(job.timeAgo)
                        .font(FontStyle.dmsansRegular.font(baseSize: 10))
                        .foregroundColor(AppColors.paleLavender)
                    
                    Spacer()

                    salaryTextView()
                }
                .padding(.horizontal)
                
            }
            .padding()
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
    BookMarkTabView(mainScreenViewModel: MainScreenViewModel(), recentJobListViewModel: RecentJobsListViewModel())
}
