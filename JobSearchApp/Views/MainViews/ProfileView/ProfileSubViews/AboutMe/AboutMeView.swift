
import SwiftUI

struct AboutMeCardView: View { 
    @ObservedObject  var viewModel: ProfileViewModal
   
    let title: String = "About me"
    let headerHeight: CGFloat = 70
    let detailsVisibleHeight: CGFloat = 165
    
    let contentSpacing: CGFloat = 0
    
    init(viewModel: ProfileViewModal) {
         self.viewModel = viewModel
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
                        .font(FontStyle.dmsansBold .font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor)
                    Spacer()
                    NavigationLink(destination: AboutMeCardEditView(), isActive: $viewModel.isAboutMeDetailView) {
                        Button(action: {
                            viewModel.showAboutMeDetailView()
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
            }
            .frame(height: headerHeight)

           
        }
        .background(Color.white)
        .cornerRadius(12)
      
    }

}

#Preview{
    VStack(alignment: .leading, spacing: 30) {
        AboutMeCardView(viewModel: ProfileViewModal(userProfile: UserProfile.exampleLoaded))
            .shadow(radius: 5)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.gray.opacity(0.1))
}
