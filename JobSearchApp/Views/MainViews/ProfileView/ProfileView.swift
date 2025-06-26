
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
                    .padding(.horizontal)
                    
                    
                    ScrollView {
                        
                        VStack(spacing:10){
                            
                            //Profile Header
                            ProfileHeaderView(viewModel: ProfileViewModal(userProfile: viewModel.userProfile),onEditProfile:{})
                            
                            //About MeCard
                            AboutMeCardView(viewModel:  ProfileViewModal(userProfile: viewModel.userProfile))
                            
                            //Work Header
                            
                            WorkExperienceSectionView(viewModel: ProfileViewModal(userProfile: viewModel.userProfile),
                                                      experience: viewModel.userProfile.workExperiences,
                                                      onAdd: {  },
                                                      onEditExperience: { experience in  }
                            )
                            
                            //Education
                            
                            EducationSectionView(viewModel: ProfileViewModal(userProfile: viewModel.userProfile), onAdd: {
                                
                            }, onEditEducation: { education in }, education: viewModel.userProfile.educations)
                            
                            
                            //Skills
                            
                            SkillsSectionView(vm: viewModel, onEdit: {})
                            
                            //Language
                            
                            
                            //Appreciation
                            
                            //Resume
                            
                        }
                        .padding(.horizontal,10)
                        
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical,5)
                }
                
                
            }
            
        }
    }
}


#Preview{
    if #available(iOS 16.0, *) {
        let user =  UserProfile(name: "", location: "", followerCount: 1, followingCount: 1, aboutMe: "", workExperiences: [], educations: [], skills: [],languages: [], appreciation:[])
        
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


