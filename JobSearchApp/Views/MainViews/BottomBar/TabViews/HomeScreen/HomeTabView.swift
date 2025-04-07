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
                                VStack(spacing: 5) {
                                    
                                    ImageProvider.getImage(named: "remotejob").map{ image in
                                        Image(uiImage: image)
                                            .font(FontStyle.dmsansBold.font(baseSize: 16))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text("44.5k")
                                        .font(FontStyle.dmsansBold.font(baseSize: 18))
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
                                    VStack(spacing: 5) {
                                        Text("66.8k")
                                            .font(FontStyle.dmsansBold.font(baseSize: 18))
                                            .foregroundColor(AppColors.deepIndigo)
                                        Text("Full Time")
                                            .font(FontStyle.dmsansRegular.font(baseSize: 14))
                                            .foregroundColor(AppColors.deepIndigo)
                                    }
                                    .frame(width: geometry.size.width * 0.45, height: 85)
                                    .background(AppColors.skyLavender)
                                    .cornerRadius(10)
                                    
                                    VStack(spacing: 5) {
                                        Text("38.9k")
                                            .font(FontStyle.dmsansBold.font(baseSize: 18))
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
                        HStack{
                            Text("Recent Job List")
                                .font(FontStyle.dmsansBold.font(baseSize: 15))
                                .foregroundColor(AppColors.darkIndigoColor)
                            Spacer()
                            NavigationLink(destination:  RecentJobsListView(viewModel: viewModel)
                                           , isActive: $viewModel.isNavigateSeeMoreJobs){
                                Button(action:{
                                    viewModel.isNavigateSeeMoreJobs = true
                                }){
                                    Text("See More")
                                        .font(FontStyle.dmsansBold.font(baseSize: 15))
                                        .foregroundColor(AppColors.darkIndigoColor)
                                        .padding(.horizontal)
                                    
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical,5)
                        
                        
                        LazyVStack {
                            ForEach(viewModel.jobs) { job in
                                JobCardView(job: job)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 60)
                    
                }
                .ignoresSafeArea(.all)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text("")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    if #available(iOS 16.0, *) {
        HomeTabView()
    } else {
        // Fallback on earlier versions
    }
}

