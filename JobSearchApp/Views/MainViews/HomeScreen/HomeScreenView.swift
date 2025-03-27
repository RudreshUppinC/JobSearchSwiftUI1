import SwiftUI

@available(iOS 16.0, *)
struct HomeScreenView: View {
    let leadingConstraint: CGFloat = 20
    let spacingConstraint: CGFloat = 20

    let viewWidth: CGFloat = 153
    let viewWidthForSecond: CGFloat = 182
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.paleGray
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack(alignment: .leading) {

                        HStack {
                            VStack(alignment: .leading) {
                                Text("Hello")
                                    .font(FontStyle.dmsansBold.font(baseSize: 21))
                                    .foregroundColor(AppColors.deepIndigo)
                                    .bold()
                                Text("Orlando Diggs.")
                                    .font(FontStyle.dmsansBold.font(baseSize: 21))
                                    .foregroundColor(AppColors.deepIndigo)
                                    .bold()
                            }
                            Spacer()
                            Image("usrprofile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 37, height: 37)
                                .clipShape(Circle())
                        }
                        .padding(.horizontal)

                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color(red: 0.1, green: 0.1, blue: 0.5))
                                .frame(height: 143)

                            HStack(spacing: 0) {
                                    
                                    VStack(alignment: .leading) {
                                        Text("50% off")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 16))
                                            .foregroundColor(.white)
                                        Text("take any courses")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 16))
                                            .foregroundColor(.white)
                                            .lineLimit(1)
                                        
                                        Button(action: {
                                            
                                            print("Join Now tapped")
                                        }) {
                                            Text("Join Now")
                                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                                .padding(.horizontal, 17)
                                                .foregroundColor(.white)
                                        }
                                        .frame(height: 26)
                                        .background(Color.orange)
                                        .cornerRadius(4)
                                        .padding(.vertical, 12)
                                        
                                    }
                                    .padding(.horizontal)
                                    
                                    Image("women")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: .infinity, height: 180)
                                        .offset(x:0, y: -20)
                                        .layoutPriority(1)

                            }
                        }
                        .padding(.horizontal)
                        .fixedSize(horizontal: false, vertical: true)

                        Text("Find Your Job")
                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
           
                                GeometryReader { geometry in
                                    let screenWidth = geometry.size.width
                                    let leftPadding: CGFloat = 23
                                    let totalPadding =  screenWidth - (2 * leftPadding)
                                    
                                    HStack(spacing:15) {
                                        VStack {
                                            Image(systemName: "network")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.black)
                                            Text("44.5k")
                                                .font(.system(size: 16, weight: .bold, design: .default))
                                                .foregroundColor(.black)
                                            Text("Remote Job")
                                                .font(.system(size: 14, weight: .regular, design: .default))
                                                .foregroundColor(.black)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        .frame(width: totalPadding * 0.45)
                                        .background(Color(red: 0.7, green: 0.9, blue: 1.0))
                                        .background(.red)
                                        .cornerRadius(10)
                                      
                                        
                                        VStack(spacing: 10){
                                                VStack {
                                                    Text("66.8k")
                                                        .font(.system(size: 16, weight: .bold, design: .default))
                                                        .foregroundColor(.black)
                                                    Text("Full Time")
                                                        .font(.system(size: 14, weight: .regular, design: .default))
                                                        .foregroundColor(.black)
                                                }
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                                .background(Color(red: 0.8, green: 0.8, blue: 0.95))
                                                .cornerRadius(10)
                                                
                                                VStack (){
                                                    Text("38.9k")
                                                        .font(.system(size: 16, weight: .bold, design: .default))
                                                        .foregroundColor(.black)
                                                    Text("Part Time")
                                                        .font(.system(size: 14, weight: .regular, design: .default))
                                                        .foregroundColor(.black)
                                                }
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                                .background(Color(red: 1.0, green: 0.8, blue: 0.6))
                                                .cornerRadius(10)
                                            
                                        }
                                        .frame(width: totalPadding * 0.55)
                                    }
                                    .frame(width: screenWidth, height: 170)
                                }
                                .frame(height: 170)
                        
                        Spacer()
                        
                        Text("Recent Job List")
                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal)

                        JobCardView()
                        JobCardView()
                        Spacer()
                    }
                }
                
            }
            BottomNavigationBarView()

        }
        .navigationBarBackButtonHidden(true)
    }
}


struct JobCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(height:149)
            .shadow(radius: 3)
            .padding(.horizontal)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Image("apple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .background(Color.orange)
                        VStack(alignment: .leading) {
                            Text("Product Designer")
                                .font(FontStyle.dmsansBold.font(baseSize: 14))
                                .foregroundColor(.black)
                            Text("Google inc · California, USA")
                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                .foregroundColor(.black)
                        }

                        Spacer()
                        Image(systemName: "bookmark")
                            .foregroundColor(.gray)
                    }
                    
                    Text("$15K / Mo")
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(.black)
                    HStack {
                        Text("Senior designer")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                        Text("Full time")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                        Spacer()
                        Text("Apply")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(red: 1.0, green: 0.8, blue: 0.6))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    .padding(.top, 5)
                }
                .padding()
            }
    }
}


struct BottomNavigationBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                VStack {
                    Image("Home")
                        .font(.title3)
                    Text("Home")
                        .font(.caption)
                }
                .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                VStack {
                    Image("reconnect")
                        .font(.title3)
                    Text("Connect")
                        .font(.caption)
                }
                .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                ZStack {
                    Circle()
                        .fill(Color("calenderColor"))
                        .frame(width: 50, height: 50)
                    Image(systemName: "calendar")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .offset(y: -10)
              
            }
            Spacer()
            Button(action: {}) {
                VStack {
                    Image("chat")
                        .font(.title3)
                    Text("History")
                        .font(.caption)
                }
                .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                VStack {
                    Image("bookmark")
                        .font(.title3)
                    Text("Profile")
                        .font(.caption)
                }
                .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
    }
}



#Preview("iPhone SE (Approximate)") {
    if #available(iOS 16.0, *) {
        HomeScreenView()
            .previewLayout(.sizeThatFits)
            .environment(\.dynamicTypeSize, .small)
    } else {
        // Fallback on earlier versions
    }
}

#Preview("iPhone 16") {
    if #available(iOS 16.0, *) {
        HomeScreenView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 16"))
    } else {
        // Fallback on earlier versions
    }
}
