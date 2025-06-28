//
//  RecentJobsListView.swift
//  JobSearchApp
//
//  Created by DarkMoon on 05/04/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct RecentJobsListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject  var mainScreenViewModel : MainScreenViewModel
    
    @StateObject  var recentJobListViewModel =  RecentJobsListViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.paleGray
                    .ignoresSafeArea(.all)
                
                VStack(spacing:20){
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            ImageProvider.getImage(named: "BackArrow").map{ image in
                                Image(uiImage: image)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(recentJobListViewModel.jobsData.indices, id: \.self){ index in
                                let job = recentJobListViewModel.jobsData[index]
                                JobCardView(job: job)
                            }
                        }
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}



@available(iOS 16.0, *)
struct JobCardView: View {
    let job: Jobs
    @StateObject private var viewModal = UploadCVViewModel()
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .frame(height:155)
            .shadow(radius: 1)
            .padding(.horizontal)
            .overlay {
                VStack(alignment: .leading) {
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
                        
                        VStack(alignment: .leading) {
                            Text(job.jobTitle)
                                .font(FontStyle.dmsansBold.font(baseSize: 14))
                                .foregroundColor(AppColors.darkIndigoColor)
                            Text(job.location)
                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                .foregroundColor(AppColors.dustyLavender)
                        }
                        
                        Spacer()
                        
                        Button(action:{
                            
                        }
                               , label: {
                            ImageProvider.getImage(named: "bookmarkUnSelect").map{ image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 15, height: 15)
                            }
                        })
                    }
                    .padding(.horizontal,20)
                    .padding(.top,15)

                    HStack{
                        salaryTextView()
                        Spacer()
                    }
                    .padding(.horizontal,20)
                    .padding(.bottom,10)
                    .padding(.top,15)

                    HStack {
                        Text(job.jobTitle)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .foregroundColor(AppColors.dustyLavender)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(AppColors.mutatedLavender)
                            .cornerRadius(5)
                        
                        Text(job.jobType)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .foregroundColor(AppColors.dustyLavender)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(AppColors.mutatedLavender)
                            .cornerRadius(5)
                        
                        Spacer()
                        
                        NavigationLink(destination:DescriptionView(job: job), isActive:$viewModal.isDescriptiveView ){
                            
                            Button(action: {
                                viewModal.isDescriptiveView = true
                            })
                            {
                                Text("Apply")
                                    .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 8)
                                    .background(AppColors.cosmosColor)
                                    .foregroundColor(AppColors.dustyLavender)
                                    .cornerRadius(5)
                            }
                        }
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.bottom,15)

                }
                .padding()
            }
        
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



#Preview {
    if #available(iOS 16.0, *) {
        RecentJobsListView(mainScreenViewModel: MainScreenViewModel())
    } else {
        // Fallback on earlier versions
    }
}
