
import SwiftUI

@available(iOS 16.0, *)
struct AboutMeCardView: View { 
    
    let detailsVisibleHeight: CGFloat = 165
    let detailsHiddenHeight: CGFloat = 70

    @State private var aboutMeText: String
    @State private var isAboutMeDetailView: Bool

    let title: String = "About Me"
    
    @ObservedObject var profileViewModel: ProfileViewModal

    init(viewModel: ProfileViewModal) {
        self.profileViewModel = viewModel
        self._aboutMeText = State(initialValue: viewModel.userProfile.aboutMe)
        self._isAboutMeDetailView = State(initialValue: viewModel.isAboutMeDetailView)
    }
    var body: some View {
    
        VStack(alignment: .leading, spacing: 15) {
            
            // --- Header Section ---
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
                
//                Button(action:{
////                        profileViewModel.deleteAboutMe()
//                }
//                       , label: {
//                    Text("delete")
//                        .font(FontStyle.dmsansBold.font(baseSize: 14))
//                   
//                })

                NavigationLink(destination: AboutMeCardTextView(viewModel: profileViewModel).navigationBarBackButtonHidden(true)) {
                        ImageProvider.getImage(named: "add").map { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:24,height:24)
                        }
                }
            }
            
            // --- Divider ---
            if !profileViewModel.fetchAboutMeText().isEmpty {
                Divider().background(AppColors.dividerColor)
                Text(profileViewModel.fetchAboutMeText())
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                Spacer()
            }
        }
        .padding()
        .frame(height: profileViewModel.fetchAboutMeText().isEmpty ? detailsHiddenHeight : detailsVisibleHeight)
        .background(AppColors.white)
        .cornerRadius(12)
    }

}

