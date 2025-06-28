
import SwiftUI

@available(iOS 16.0, *)
struct AboutMeCardView: View { 
   
    let headerHeight: CGFloat = 70
    let detailsVisibleHeight: CGFloat = 165
    let aboutMeText: String
    @Binding var isShowingEditView: Bool
    let title: String = "About Me"

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
                    NavigationLink(destination: AboutMeCardEditView()
                        .navigationBarBackButtonHidden(true),
                                   isActive: $isShowingEditView) {
                        Button(action: {
                            self.isShowingEditView = true
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
                
                Text(aboutMeText)
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .lineLimit(3)
                    .foregroundColor(AppColors.dustyLavender)
                    .padding(.horizontal,20)

            }
            .frame(height: detailsVisibleHeight)
        }
        .background(Color.white)
        .cornerRadius(12)
    }
}

