import SwiftUI

struct MyConnectTabView: View {
    @StateObject private var viewModel = MyConnectViewModel()
    @ObservedObject  var mainScreenViewModel : MainScreenViewModel

    var body: some View {
        GeometryReader { geometry in
            let columnCount = calculateColumnCount(for: geometry.size.width)
            let spacing: CGFloat = 15
            let availableWidth = geometry.size.width - (2 * 15)
            let itemWidth = (availableWidth - (CGFloat(columnCount - 1) * spacing)) / CGFloat(columnCount)
            
            let columns: [GridItem] = Array(repeating: GridItem(.fixed(itemWidth), spacing: spacing), count: columnCount)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(viewModel.companies, id: \.name) { company in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                            
                            VStack(alignment: .center, spacing: 8) {
                                Image(company.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                Text(company.name)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                
                                Text(company.followerCount)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Button(action: {
                                    viewModel.followCompany(company: company)
                                }){
                                    Text("Follow")
                                        .foregroundColor(AppColors.deepIndigo)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(
                                            RoundedRectangle(cornerRadius:15)
                                                .stroke(AppColors.pinkbutton,lineWidth:1.5)
                                                .frame(width:100,height:30)
                                        )
                                }
                            }
                        }
                        .frame(width: itemWidth, height: 190)
                    }
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("")
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func calculateColumnCount(for screenWidth: CGFloat) -> Int {
        if screenWidth > 480 {
            return 3
        } else {
            return 2
        }
    }
}

#Preview {
    MyConnectTabView(mainScreenViewModel: MainScreenViewModel())
}
