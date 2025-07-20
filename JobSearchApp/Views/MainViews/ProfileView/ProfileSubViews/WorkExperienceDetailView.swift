//
//  WorkExperienceDetailView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 03/07/25.
//

import SwiftUI


@available(iOS 16.0, *)
struct WorkExperienceDetailView: View {
    // MARK: - State Properties
    @State private var jobTitle: String = ""
    @State private var company: String = ""
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var description: String = ""
    @State private var isCurrentPosition: Bool = false
    @State var rememberMe: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        ZStack {
            AppColors.paleGray
                .ignoresSafeArea(.all)
            
            VStack {
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
                .padding(.horizontal,15)
                .padding(.bottom,5)
                
                ScrollView {
                    // Main content card
                    VStack(spacing: 24) {
                        
                        
                        // MARK: - Form Fields
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Add work experience")
                                .font(FontStyle.dmsansBold.font(baseSize: 16))
                                .foregroundColor(AppColors.darkIndigoColor)
                                .padding(.leading,4)
                            ValidatedTextField(
                                "Job title",
                                text: $jobTitle,
                                placeholder: "Company"
                            )
                            
                            ValidatedTextField(
                                "Company",
                                text: $company,
                                placeholder: "Company"
                            )
                            
                            HStack(spacing: 16) {
                                ValidatedTextField(
                                    "Start date",
                                    text: $startDate,
                                    placeholder: ""
                                )
                                ValidatedTextField(
                                    "End date",
                                    text: $endDate,
                                    placeholder: ""
                                )
                                .disabled(isCurrentPosition)
                                .opacity(isCurrentPosition ? 0.5 : 1.0)
                            }
                            
                            HStack{
                                Button{
                                } label: {
                                    ImageProvider.getImage(named: self.rememberMe ? "checkBoxSel": "checkBox" ).map{ image in
                                        Image(uiImage: image)
                                    }
                                    
                                }
                                .frame(width:25,height: 25)
                                
                                Text("This is my position now")
                                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                                    .foregroundColor(AppColors.paleLavender)
                                Spacer()
                                
                            }
                            .padding(.bottom, 15)
                            
                            createValidatedTextEditor()
                        }
                        
                        
                        HStack(spacing: 10) {
                            Button(action: {
                                
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
                            
                            Button(action: {
                                
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
                        .padding(.top,20)
                        .padding(.bottom ,10)

                    }
                    .cornerRadius(30)
                    .shadow(color: AppColors.black.opacity(0.05), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 10)
                }
                .scrollIndicators(.hidden)
                
            }
            .padding(.horizontal, 20)
            
        }
    }
    
    // MARK: - UI Helper Methods
    
    
    
    /// Creates the description text editor with validation and a placeholder.
    private func createValidatedTextEditor() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(FontStyle.dmsansBold.font(baseSize: 11))
                .foregroundColor(AppColors.darkIndigoColor)
            
            
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $description)
                    .font(FontStyle.dmsansRegular.font(baseSize: 11))
                    .foregroundColor(AppColors.paleLavender)
                    .scrollContentBackground(.hidden)
                    .padding(8)
                    .onChange(of: description) { newValue in
                        // Same validation logic for the description field
                        let filtered = newValue.filter { $0.isLetter || $0.isWhitespace }
                        if newValue != filtered {
                            print("Validation Error: Only letters and spaces are allowed.")
                            description = filtered
                        }
                    }
                
                
                if description.isEmpty {
                    Text("Write additional information here")
                        .font(FontStyle.dmsansRegular.font(baseSize: 11))
                        .foregroundColor(AppColors.paleLavender)
                        .padding(16)
                        .allowsHitTesting(false)
                }
            }
            .frame(height: 150)
            .background(AppColors.white)
            .cornerRadius(10)
        }
    }
    
}


// MARK: - Custom Toggle Style for Checkbox
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.1)) {
                configuration.isOn.toggle()
            }
        }) {
            HStack(spacing: 12) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .font(.system(size: 24))
                    .foregroundColor(configuration.isOn ? .indigo : .secondary.opacity(0.5))
                
                configuration.label
            }
        }
        .buttonStyle(.plain)
    }
}

