
import SwiftUI

@available(iOS 16.0, *)
struct AboutMeCardView: View { 
    
    let headerHeight: CGFloat = 70
    let detailsVisibleHeight: CGFloat = 165
    
    @State private var aboutMeText: String
    @State private var isAboutMeDetailView: Bool

    let title: String = "About Me"
    
    @ObservedObject var profileViewModel: ProfileViewModal

    init(viewModel: ProfileViewModal) {
        self.profileViewModel = viewModel
        self._aboutMeText = State(initialValue: viewModel.userProfile.aboutMe)
        self._isAboutMeDetailView = State(initialValue: viewModel.isAboutMeDetailView)
    }
    
    var body:some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    ImageProvider.getImage(named: "aboutMe").map{
                        image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                    }
                    .padding(.trailing,8)
                    Text(title)
                        .font(FontStyle.dmsansBold.font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor)
                    Spacer()
                    NavigationLink(destination: AboutMeCardEditView(viewModel: profileViewModel)
                        .navigationBarBackButtonHidden(true),
                                   isActive: $profileViewModel.isAboutMeDetailView) {
                        Button(action: {
                            profileViewModel.isAboutMeDetailView = true
                        }) {
                            ImageProvider.getImage(named: "add").map { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:24,height:24)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
                
                VStack{
                    Divider()
                        .background(AppColors.dividerColor)
                }
                .padding(.bottom,15)
                .padding(.horizontal,20)
                
                Text(profileViewModel.fetchAboutMeText())
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .lineLimit(3)
                    .foregroundColor(AppColors.dustyLavender)
                    .padding(.horizontal,20)
                
            }
            .frame(height: detailsVisibleHeight)
        }
        .background(AppColors.white)
        .cornerRadius(12)
    }
}

