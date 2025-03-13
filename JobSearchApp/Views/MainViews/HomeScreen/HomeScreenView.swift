import SwiftUI

@available(iOS 16.0, *)
struct HomeScreenView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.uiuxBgcolor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        // Top Section (unchanged)
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
                            Image("profile_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                        .padding()
                        
                        // Banner (unchanged)
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color(red: 0.1, green: 0.1, blue: 0.5)) // Dark blue
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
                                .padding()
                                Spacer()
                                Image("course_image") // Replace with your actual course image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 200)
                                    .offset(x: 20, y: 0)
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        // Find Your Job (unchanged)
                        Text("Find Your Job")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 0.7, green: 0.9, blue: 1.0)) // Light Blue
                                .frame(width: 150, height: 100)
                                .overlay {
                                    VStack {
                                        Image(systemName: "list.bullet.clipboard") // Custom system image
                                            .font(.system(size: 30))
                                            .foregroundColor(.black)
                                        Text("44.5k")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Text("Remote Job")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                }
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 0.8, green: 0.8, blue: 0.95)) // Light Purple
                                .frame(width: 150, height: 100)
                                .overlay {
                                    VStack {
                                        Text("66.8k")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Text("Full Time")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 1.0, green: 0.8, blue: 0.6)) // Light Orange
                                .frame(width: 150, height: 100)
                                .overlay {
                                    VStack {
                                        Text("38.9k")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Text("Part Time")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.trailing)
                        }
                        
                        // Recent Job List
                        Text("Recent Job List")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        JobCardView() // Use the new JobCardView
                        
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
                        Image("apple_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text("Product Designer")
                                .font(.headline)
                            Text("Google inc · California, USA")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "bookmark")
                            .foregroundColor(.gray)
                    }
                    Text("$15K / Mo")
                        .font(.headline)
                    HStack {
                        Text("Senior designer")
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                        Text("Full time")
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(.systemGray5))
                            .cornerRadius(5)
                        Spacer()
                        Text("Apply")
                            .font(.caption)
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
        HomeScreenView()
    } else {
        // Fallback on earlier versions
    }
}
