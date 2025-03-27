import SwiftUI

@available(iOS 16.0, *)
struct HomeTabView: View {

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
                                    .font(FontStyle.dmsansBold.font(baseSize: 22))
                                    .bold()
                                Text("Orlando Diggs.")
                                    .font(FontStyle.dmsansBold.font(baseSize: 22))
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

                        // Banner (unchanged)
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color(red: 0.1, green: 0.1, blue: 0.5))
                                .frame(height: 143)

                            HStack {
                                VStack(alignment: .leading) {
                                    Text("50% off")
                                        .font(FontStyle.dmsansRegular.font(baseSize: 16))
                                        .foregroundColor(.white)
                                    Text("take any courses")
                                        .font(FontStyle.dmsansRegular.font(baseSize: 16))
                                        .foregroundColor(.white)

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
                                Spacer()
                                Image("women")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 190, height: 180)
                                    .offset(x:0, y: -20)

                            }
                        }
                        .padding(.horizontal)

                        // Find Your Job - KEEP THIS STRUCTURE (MOSTLY)
                        Text("Find Your Job")
                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal)

                        GeometryReader { geometry in
                            HStack(spacing:geometry.size.width * 0.10) {
                                VStack {
                                    Image("remotejob")
                                        .font(FontStyle.dmsansBold.font(baseSize: 16))
                                        .foregroundColor(.black)
                                    Text("44.5k")
                                        .font(FontStyle.dmsansBold.font(baseSize: 16))
                                        .foregroundColor(.black)
                                    Text("Remote Job")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.black)

                                }
                                .frame(width: geometry.size.width * 0.40, height: 170)
                                .background(Color(red: 0.7, green: 0.9, blue: 1.0))
                                .cornerRadius(10)
                                .padding(.leading, geometry.size.width * 0.05)

                                VStack {
                                    VStack {
                                        Text("66.8k")
                                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                                            .foregroundColor(.black)
                                        Text("Full Time")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 14))
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: geometry.size.width * 0.45, height: 85)
                                    .background(Color(red: 0.8, green: 0.8, blue: 0.95))
                                    .cornerRadius(10)

                                    VStack {
                                        Text("38.9k")
                                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                                            .foregroundColor(.black)
                                        Text("Part Time")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 14))
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: geometry.size.width * 0.45, height: 85)
                                    .background(Color(red: 1.0, green: 0.8, blue: 0.6))
                                    .cornerRadius(10)

                                }
                                .frame(width: geometry.size.width * 0.35, height: 170)
                                .padding(.trailing, geometry.size.width * 0.05)

                            }
                        }
                        .frame(height: 175)
                        
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
                        Image("appleIcon")
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




#Preview {
    if #available(iOS 16.0, *) {
        HomeTabView()
    } else {
        // Fallback on earlier versions
    }
}

