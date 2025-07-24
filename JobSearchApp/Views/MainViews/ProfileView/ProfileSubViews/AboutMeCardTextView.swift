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
    let characterLimit = 100
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var profileViewModel: ProfileViewModal
    
    @State private var aboutMeText: String
    @State private var isCoreDataText: Bool
    @State private var isSheetPresented = false
    @State private var isRemoved = false
    
    init(viewModel: ProfileViewModal) {
        self.profileViewModel = viewModel
        let textFromCoreData = viewModel.fetchAboutMeText()
        let initialText = textFromCoreData.isEmpty ? "" : textFromCoreData
        self._aboutMeText = State(initialValue: initialText)
        
        if !initialText.isEmpty {
            self._isCoreDataText = State(initialValue: true)
        } else {
            self._isCoreDataText = State(initialValue: false)
        }
    }
    
    @FocusState private var isEditorFocused: Bool
    
    
    // MARK: - UI Body
    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.paleGray
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        Button(action: {
                            if isCoreDataText {
                                isRemoved = false
                                isSheetPresented = true
                            } else {
                                dismiss()
                            }
                        }){
                            
                            ImageProvider.getImage(named: isCoreDataText ? "removeBtn" : "BackArrow").map{ image in
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
                            
                            VStack {
                                HStack(spacing: 10) {
                                    if isCoreDataText {
                                        Button(action: {
                                            isSheetPresented = true
                                            isRemoved = true
                                        }) {
                                            Text("Remove")
                                                .font(FontStyle.dmsansBold.font(baseSize: 14))
                                                .foregroundColor(AppColors.white)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(AppColors.pastelLavender)
                                                .cornerRadius(10)
                                        }
                                        .padding(.leading,10)
                                    }
                                    
                                    Button(action: {
                                        print("Save Tapped! Text: \(aboutMeText)")
                                        profileViewModel.saveAboutMe(text: aboutMeText)
                                        dismiss()
                                    }) {
                                        Text("SAVE")
                                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                                            .foregroundColor(AppColors.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(AppColors.deepBlue)
                                            .cornerRadius(10)
                                    }
                                    .padding(.trailing,10)
                                    
                                }
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, isCoreDataText ? 0 : 60)
                                .padding(.top,30)
                                .padding(.bottom ,10)
                            }
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
            UndoAboutMeCardTextView(profileViewModel: profileViewModel, isSheetPresented: $isSheetPresented, aboutMeText: $aboutMeText, isRemoved: $isRemoved, isCoreDataText: $isCoreDataText)
                .presentationDetents([.height(260)])
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct UndoAboutMeCardTextView: View {
    @ObservedObject  var profileViewModel : ProfileViewModal

    @Binding var isSheetPresented: Bool
    @Binding var aboutMeText: String
    @Binding var isRemoved: Bool
    @Binding var isCoreDataText: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Capsule()
                    .fill(AppColors.deepBlue)
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                Text(isRemoved ? "Remove about me" : "Undo Changes?")
                    .font(FontStyle.dmsansBold.font(baseSize: 16))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.top)
                
                Text(isRemoved ? "Are you sure you want to delete this about me?": "Are you sure you want to change what you entered?")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack {
                    Button(action: {
                        print("UNDO")
                        profileViewModel.deleteAboutMe()
                        isSheetPresented = false
                        isCoreDataText = false
                        isRemoved = false
                        aboutMeText = ""
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
                        isSheetPresented = false
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

