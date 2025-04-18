//
//  SplashView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct SplashView: View {
    
    @State private var isNavigateToWelcomScreen:Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color("bgColor").edgesIgnoringSafeArea(.all)
                VStack(spacing:5){
                    ImageProvider.getImage(named: "Group").map { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                    
                    Text("Jobspot")
                        .font(FontStyle.dmsansBold.font(baseSize: 29))
                        .foregroundColor(Color.white)
                }
                .frame(maxHeight:.infinity)
                .onAppear{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){
                        isNavigateToWelcomScreen = true
                    }
                }
                
                NavigationLink(
                    destination: MainSplashScreen(), isActive: $isNavigateToWelcomScreen, label: {
                        EmptyView()
                    }
                )
            }
        }
        
        
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        SplashView()
    } else {
        // Fallback on earlier versions
    }
}
