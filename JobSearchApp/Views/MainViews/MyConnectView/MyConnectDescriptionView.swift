//
//  MyConnectDescriptionView.swift
//  JobSearchApp
//
//  Created by Way2 on 17/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct MyConnectDescriptionView: View {
    @ObservedObject var viemodel = MyConnectDescriptionViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.offWhite.edgesIgnoringSafeArea(.all)
                VStack {
                    
                    HStack {
                        Button(action: {
                           // presentationMode.wrappedValue.dismiss()
                        }){
                            Image("BackArrow")
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    HeaderView()
                    
                    ScrollView{
                        HStack{
                            
                            ForEach(SegmentedOption.allCases, id:  \.self) { option in
                                Button(action:{
                                    viemodel.selected = option
                                }) {
                                    Text(option.rawValue)
                                        .font(.headline)
                                        .foregroundColor(viemodel.selected == option ? .black: .red)
                                        .padding(.vertical, 8)
                                        .frame(maxWidth:.infinity)
                                        .background(viemodel.selected == option ? Color.orange.opacity(0.8) : Color.clear)
                                        .cornerRadius(9)
                                }
                                
                            }
                        }
                       
                switch viemodel.selected{
                        case .aboutUs:
                            AboutUsView()
                        case .jobs:
                            JobsListView()
                        case .post:
                            PostView()
                        }
                        
                }
                   
                    
                }
            }
        }        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        MyConnectDescriptionView()
    } else {
        // Fallback on earlier versions
    }
}
