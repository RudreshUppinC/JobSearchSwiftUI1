
//  ProfileView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct ProfileView:View{
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject  var viewModel: ProfileViewModal
    var body: some View {
        NavigationStack {
            ZStack {
                
                AppColors.paleGray.ignoresSafeArea(.all)
                VStack {
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
                    .padding(.horizontal,5)
                    
                    ScrollView {
                        
                        VStack(spacing:15){
                            
                            //Profile Header
                            ProfileHeaderView(onEditProfile: {}, userProfile: UserProfile.exampleLoaded, isShowingEditProfile: $viewModel.isEditProfileDetailView)
                            
                            //About MeCard
                            AboutMeCardView(
                                viewModel: viewModel,
                            )
                            
                            //Work Header
                            
                            WorkExperienceView(onAdd: {}, onEditExperience: {expereience in }, workExperience: viewModel.userProfile.workExperiences, isShowingWorkDetailView: $viewModel.isWorkDetailView)
                            
                            //Education
                            
                            EducationSectionView(educations: viewModel.userProfile.educations, onAdd: {}, onEditEducation: { education in })
                            
                            //Skills
                            
                            SkillsSectionView(onEdit: {}, skills: viewModel.userProfile.skills)
                            
                            //Language
                            
                            LanguageSectionView(onEdit: {}, onAdd: {}, languages: viewModel.userProfile.languages)
                            //Appreciation
                            
                            AppreciationSectionView(appreciations: viewModel.userProfile.appreciations, onAdd: {}, onEditAppreciation: { oneditappreciation in })
                            
                            //Resume
                            ResumeCardView(onAdd: {}, onDelete: {resums in }, onEdit: {}, resumes: viewModel.userProfile.resumes)
                        }
                        .padding(.horizontal,10)
                        
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical,5)
                }
                .padding(.horizontal,5)
            }
        }
        
    }
}


#Preview{
    if #available(iOS 16.0, *) {
        let user =  UserProfile(name: "", location: "", followerCount: 1, followingCount: 1, aboutMe: "", workExperiences: [], educations: [], skills: [],languages: [], appreciations:[], resumes: [])
        
        ProfileView(viewModel: ProfileViewModal(userProfile: user))
    } else {
        // Fallback on earlier versions
    }
}

import SwiftUI

struct EditProfileScreen: View {
    var body: some View {
        VStack {
            Text("Edit Profile Screen")
                .font(.largeTitle)
            // Add your profile editing form here
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        VStack {
            Text("Settings Screen")
                .font(.largeTitle)
            // Add your settings content here
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}


