import SwiftUI

@available(iOS 16.0, *)
struct HomeTabView: View {
    @ObservedObject  var viewModel = HomeTabViewModel()
    
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
                                    .foregroundColor(AppColors.deepIndigo)
                                Text("Orlando Diggs.")
                                    .font(FontStyle.dmsansBold.font(baseSize: 22))
                                    .foregroundColor(AppColors.deepIndigo)
                            }
                            Spacer()
                            
                            ImageProvider.getImage(named: "usrprofile").map{ image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 37, height: 37)
                                    .clipShape(Circle())
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(AppColors.deepBlue)
                                .frame(height: 143)
                            
                            HStack {
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
                                Spacer()
                                
                                ImageProvider.getImage(named: "women").map{ image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 190, maxHeight: 180)
                                        .offset(x:0, y: -20)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Find Your Job")
                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        GeometryReader { geometry in
                            HStack(spacing:geometry.size.width * 0.10) {
                                VStack {
                                    
                                    ImageProvider.getImage(named: "remotejob").map{ image in
                                        Image(uiImage: image)
                                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text("44.5k")
                                        .font(FontStyle.dmsansBold.font(baseSize: 16))
                                        .foregroundColor(.black)
                                    Text("Remote Job")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.black)
                                    
                                }
                                .frame(width: geometry.size.width * 0.40, height: 170)
                                .background(AppColors.lightCyanColor)
                                .cornerRadius(10)
                                .padding(.leading, geometry.size.width * 0.05)
                                
                                VStack {
                                    VStack {
                                        Text("66.8k")
                                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                                            .foregroundColor(AppColors.deepIndigo)
                                        Text("Full Time")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 14))
                                            .foregroundColor(AppColors.deepIndigo)
                                    }
                                    .frame(width: geometry.size.width * 0.45, height: 85)
                                    .background(AppColors.skyLavender)
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
                        LazyVStack { // or LazyVStack
                            ForEach(viewModel.jobs) { job in
                                JobCardView(job: job)
                            }
                        }
                                                
                        Spacer()
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct JobCardView: View {
    let job: Job
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(height:149)
            .shadow(radius: 3)
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
                                    .frame(width: 18, height: 21)
                            }
                        }
                        .frame(width: 34, height: 34)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(job.jobTitle)
                                .font(FontStyle.dmsansBold.font(baseSize: 14))
                                .foregroundColor(.black)
                            Text(job.location)
                                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                .foregroundColor(.black)
                        }
                        
                        
                        Spacer()
                        
                        Image(systemName: "bookmark")
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                    
                    
                    Text(job.salary)
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(.black)
                        .padding(.horizontal,10)
                    
                    HStack {
                        Text(job.jobTitle)
                            .frame(height:25)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                        Text(job.jobType)
                            .frame(height:25)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                        Spacer()
                        Text("Apply")
                            .frame(width: 77, height:25)
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(red: 1.0, green: 0.8, blue: 0.6))
                            .foregroundColor(AppColors.blueColor)
                            .cornerRadius(5)
                    }
                    .padding(10)
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

