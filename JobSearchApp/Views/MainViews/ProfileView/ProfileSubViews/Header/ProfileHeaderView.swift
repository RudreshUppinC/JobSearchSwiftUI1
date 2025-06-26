//
//  ProfileHeaderView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let onEditProfile:() -> Void
    @ObservedObject  var viewModel: ProfileViewModal

    init(viewModel: ProfileViewModal,
         onEditProfile: @escaping () -> Void
    ) {
         self.viewModel = viewModel
         self.onEditProfile = onEditProfile
    }
    
    var body: some View {
        VStack{
            
            HStack(spacing:10){
                Spacer()
                ImageProvider.getImage(named: "share").map { image in
                    Image(uiImage:image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25,height: 25)
                    
                }
                ImageProvider.getImage(named: "settings").map {image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25,height: 25)
                    
                }
            }
            .padding(.top,15)
            .padding(.trailing,15)
            
            // profile image
            
            HStack(spacing: 10){
                ImageProvider.getImage(named: "usrProfile").map{ image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                }
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.horizontal,25)
            
            // profile title
            
            VStack(alignment: .leading, spacing:5){
                Text(viewModel.userProfile.name)
                    .font(FontStyle.dmsansMedium.font(baseSize: 12))
                    .foregroundColor(Color.white)
                Text(viewModel.userProfile.location)
                    .font(FontStyle.dmsansRegular.font(baseSize: 10))
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.horizontal,25)
            .padding(.vertical,10)
            
            HStack(alignment: .center, spacing: 10) {
                // MARK: - Follower/Following Info
                HStack(spacing: 5) {
                    Text(String(viewModel.userProfile.followerCount))
                        .font(FontStyle.dmsansRegular.font(baseSize: 10))
                    Text("Followers")
                        .font(FontStyle.dmsansRegular.font(baseSize: 10))

                }
                
                HStack(spacing: 5) {
                    Text(String(viewModel.userProfile.followerCount))
                        .font(FontStyle.dmsansRegular.font(baseSize: 10))
                    Text("Following")
                        .font(FontStyle.dmsansRegular.font(baseSize: 10))

                }
                
                Spacer()
                
                // MARK: - Edit Profile Button
                Button(action: {
                    print("Edit Profile tapped!")
                }) {
                    HStack(spacing: 5) {
                        Text("Edit profile")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                        Image(systemName: "pencil")
                    }
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        (AppColors.gainsboroCoor).opacity(0.25)
                    )
                    .cornerRadius(10)
                }
                
            }
            .foregroundColor(.white)
            
            .padding(.leading, 25)
            .padding(.trailing, 13)
            .frame(height: 40)
        }
        .frame(maxWidth:.infinity,idealHeight: 240,maxHeight: 240)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [AppColors.darkPurpleCardColor,AppColors.lightPurpleCardColor]), startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }
}


#Preview {
    ProfileHeaderView(viewModel: ProfileViewModal(userProfile: UserProfile.exampleLoaded), onEditProfile: {
        print("edit onEditProfile")
    })
}
