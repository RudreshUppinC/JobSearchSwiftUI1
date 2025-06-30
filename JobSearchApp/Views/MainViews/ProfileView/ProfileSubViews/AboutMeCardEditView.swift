//
//  AboutMeCardEditView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 27/06/25.
//

import SwiftUI

import SwiftUI
import Combine

@available(iOS 16.0, *)

@available(iOS 16.0, *)
struct AboutMeCardEditView: View {
    
    // MARK: - State Properties
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var aboutMeText: String = ""
    let characterLimit = 100
    
    // MARK: - UI Body
    
    var body: some View {
        // 1. ZStack is the main container for layering.
        ZStack {
            AppColors.paleGray
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $aboutMeText)
                        // ... (all your TextEditor modifiers)
                            .font(.system(size: 16))
                            .scrollContentBackground(.hidden)
                            .padding(12)
                            .onChange(of: aboutMeText) { newValue in
                                if newValue.count > characterLimit {
                                    aboutMeText = String(newValue.prefix(characterLimit))
                                }
                            }
                        
                        if aboutMeText.isEmpty {
                            Text("Tell me about you.")
                                .font(.system(size: 16))
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(17)
                                .allowsHitTesting(false)
                        }
                    }
                    .frame(minHeight: 200, maxHeight: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    // --- Character Count ---
                    HStack {
                        Spacer()
                        Text("\(aboutMeText.count) / \(characterLimit)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    
                    Spacer().frame(height: 150)
                }
            }
            .scrollIndicators(.hidden)
            
            VStack {
                Spacer() // This pushes the button to the bottom of the screen
                
                Button(action: {
                    print("Save Tapped!")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("SAVE")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 19/255, green: 1/255, blue: 96/255))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                .padding(.bottom, 100)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    ImageProvider.getImage(named: "BackArrow").map{ image in
                        Image(uiImage: image)
                    }
                }
            }
        }
    }
}
