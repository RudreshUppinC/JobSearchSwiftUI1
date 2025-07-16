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
struct AboutMeCardEditView: View {
    
    // MARK: - State Properties
    
    @Environment(\.dismiss) var dismiss
    
    @State private var aboutMeText: String = ""
    let characterLimit = 100
    @ObservedObject var viewModel: ProfileViewModal

    init(viewModel: ProfileViewModal) {
        self.viewModel = viewModel
    }
    
    @FocusState private var isEditorFocused: Bool
    
    // MARK: - UI Body
    var body: some View {
        ZStack {

            AppColors.paleGray
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("About me")
                    .font(FontStyle.dmsansBold.font(baseSize: 14))
                    .foregroundColor(AppColors.deepIndigo)
                    .padding(.top,35)
                    .padding(.bottom,25)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $aboutMeText)
                        .font(FontStyle.dmsansRegular.font(baseSize: 14))
                        .foregroundColor(AppColors.paleLavender)
                        .scrollContentBackground(.hidden)
                        .padding(12)

                        .focused($isEditorFocused)
                        .onChange(of: aboutMeText) { newValue in
                            if newValue.count > characterLimit {
                                aboutMeText = String(newValue.prefix(characterLimit))
                            }
                        }
                    
                    if aboutMeText.isEmpty {
                        Text("Tell me about you.")
                            .font(FontStyle.dmsansRegular.font(baseSize: 14))
                            .foregroundColor(AppColors.paleLavender)
                            .padding(17)
                            .allowsHitTesting(false)
                    }
                }
                .frame(maxHeight: 300)
                .background(AppColors.white)
                .cornerRadius(20)
                
                Spacer()
                VStack{
                    Button(action: {
                        dismiss()
                        print("Save Tapped! Text: \(aboutMeText)")
                        viewModel.saveAboutMe(text: aboutMeText)

                    }) {
                        Text("SAVE")
                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                            .foregroundColor(AppColors.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 19/255, green: 1/255, blue: 96/255))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal,80)
                .padding(.bottom,80)
            }
            .padding(24)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }

        .onTapGesture {
            isEditorFocused = false
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }){
                    ImageProvider.getImage(named: "BackArrow").map{ image in
                        Image(uiImage: image)
                    }
                }
            }
        }
    }
}
