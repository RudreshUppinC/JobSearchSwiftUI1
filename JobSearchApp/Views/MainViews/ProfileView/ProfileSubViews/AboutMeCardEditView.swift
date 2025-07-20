//
//  AboutMeCardTextView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 27/06/25.
//

import SwiftUI

import SwiftUI
import Combine


@available(iOS 16.0, *)
struct AboutMeCardTextView: View {
    
    // MARK: - State Properties
    
    @Environment(\.dismiss) var dismiss
    
    let characterLimit = 100
    @ObservedObject var profileViewModel: ProfileViewModal
    @State private var aboutMeText: String
    
    init(viewModel: ProfileViewModal) {
        self.profileViewModel = viewModel
        let textFromCoreData = viewModel.fetchAboutMeText()
        let initialText = textFromCoreData.isEmpty ? "Tell me about you." : textFromCoreData
        self._aboutMeText = State(initialValue: initialText)
    }
    
    @FocusState private var isEditorFocused: Bool
    @State private var isSheetPresented = false
    
    // MARK: - UI Body
    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.paleGray
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        Button(action: {
                            dismiss()
                        }){
                            ImageProvider.getImage(named: "BackArrow").map{ image in
                                Image(uiImage: image)
                            }
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal,15)
                    
                    
                    ScrollView {
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
                            .frame(height: 300)
                            .background(AppColors.white)
                            .cornerRadius(20)
                            
                            VStack{
                                Button(action: {
                                    print("Save Tapped! Text: \(aboutMeText)")
                                    isSheetPresented = true
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
                    
                   
                }
                if isSheetPresented {
                    AppColors.black.opacity(0.6)
                        .ignoresSafeArea()
                }
                
            }
            
        }
        .onTapGesture {
            isEditorFocused = false
        }
        .sheet(isPresented: $isSheetPresented) {
            UndoAboutMeCardTextView(isSheetPresented: $isSheetPresented, profileViewModel: profileViewModel)
                .presentationDetents([.height(260)])
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct UndoAboutMeCardTextView: View {
    @Binding var isSheetPresented: Bool
    @ObservedObject  var profileViewModel : ProfileViewModal
    
    var body: some View {
        ZStack {
            VStack {
                Capsule()
                    .fill(AppColors.deepBlue)
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                Text("Undo Changes ?")
                    .font(FontStyle.dmsansBold.font(baseSize: 16))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.top)
                
                Text("Are you sure you want to change what you entered?")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                VStack {
                    Button(action: {
                        print("Undo Changes")
                    }) {
                        Text("UNDO CHANGES")
                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                            .foregroundColor(AppColors.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColors.deepBlue)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    Button(action: {
                        print("Continue Filling")
                        
                    }) {
                        Text("CONTINUE FILLING")
                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                            .foregroundColor(AppColors.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColors.pastelLavender)
                            .cornerRadius(10)
                    }
                    .padding(.top, 5)
                    Spacer()
                }
                .padding()
                
            }
            
            .navigationBarBackButtonHidden(true)
            .padding(.vertical, 20)
        }
        .ignoresSafeArea()
        
    }
    
}

