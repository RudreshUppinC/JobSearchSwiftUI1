//
//  RecentJobsListView.swift
//  JobSearchApp
//
//  Created by DarkMoon on 05/04/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct RecentJobsListView: View {
    @ObservedObject var viewModel: HomeTabViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.paleGray
                    .edgesIgnoringSafeArea(.all)
                
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
                            ForEach(viewModel.jobs) { job in
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
    let job: Job
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
                        
                        Image(systemName: "bookmark")
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                    
                    
                    HStack{
                        salaryTextView()
                        Spacer()
                    }.padding(.horizontal,10)
                    
                    
                    HStack {
                        Text(job.jobTitle)
                            .frame(height:24)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(AppColors.mutatedLavender)
                            .foregroundColor(AppColors.dustyLavender)
                            .cornerRadius(5)
                        Text(job.jobType)
                            .frame(height:24)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(AppColors.mutatedLavender)
                            .foregroundColor(AppColors.dustyLavender)
                            .cornerRadius(5)
                        Spacer()
                        
                        NavigationLink(destination:DescriptionView(job: job), isActive:$viewModal.isDescriptiveView ){
                            
                            Button(action: {
                                viewModal.isDescriptiveView = true
                            })
                            {
                                Text("Apply")
                                    .frame(width: 77, height:24)
                                    .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(AppColors.cosmosColor)
                                    .foregroundColor(AppColors.dustyLavender)
                                    .cornerRadius(5)
                            }
                        }
                        
                    }
                    .padding(10)
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
        RecentJobsListView(viewModel:   HomeTabViewModel())
    } else {
        // Fallback on earlier versions
    }
}
