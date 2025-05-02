//
//  ImageCarouselView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 02/05/25.
//

import SwiftUI
struct ImageCarouselView: View {
    @Environment(\.presentationMode) var presentationMode

    let allImageNames: [String]
   
    let initialImageName: String?
    
   
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing:20){
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    ImageProvider.getImage(named: "BackArrow").map{ image in
                        Image(uiImage: image)
                    }
                }
                
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            
          
            TabView(selection: $selectedIndex) {
                ForEach(allImageNames.indices, id: \.self) { index in
                    Image(allImageNames[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
            
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .background(AppColors.black.ignoresSafeArea())
            .onAppear {
                if let initialName = initialImageName,
                   let initialIndex = allImageNames.firstIndex(of: initialName) {
                    selectedIndex = initialIndex
                } else {
                    selectedIndex = 0
                }
            }
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)

    }
}

// MARK: - Preview
#Preview {
   
    NavigationView {
        ImageCarouselView(
            
            allImageNames: ["companyimg1",
                            "companyimg1",
                            "companyimg1",
                            "companyimg1",
                            "companyimg1",
                            "companyimg1"],
            initialImageName: "companyimg1"
        )
    }
}
