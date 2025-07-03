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
            
            ScrollView {
                // Main content card
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: - Header
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
                    
                    Text("Add work experience")
                        .font(FontStyle.dmsansBold.font(baseSize: 16))
                        .foregroundColor(AppColors.darkIndigoColor)
                    
                    // MARK: - Form Fields
                    VStack(alignment: .leading, spacing: 20) {
                        createValidatedTextField(label: "Job title", binding: $jobTitle)
                        createValidatedTextField(label: "Company", binding: $company)
                        
                        HStack(spacing: 16) {
                            createValidatedTextField(label: "Start date", binding: $startDate, placeholder: "")
                            createValidatedTextField(label: "End date", binding: $endDate, placeholder: "")
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
                        .padding(.bottom, 25)
                        
                        createValidatedTextEditor()
                    }
                    
                    Spacer(minLength: 20)
                    
                    //                    NavigationLink(destination:  MainScreenView()
                    //                                   ){
                    Button(action: {
                        print("SAVE")
                    }) {
                        Text("SAVE")
                            .font(FontStyle.dmsansBold.font(baseSize: 14))
                            .foregroundColor(AppColors.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColors.deepBlue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 15)
                    
                }
                .cornerRadius(30)
                .shadow(color: AppColors.black.opacity(0.05), radius: 10, x: 0, y: 5)
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 20)
            
        }
    }
    
    // MARK: - UI Helper Methods
    
    /// Creates a labeled text field with letter-only validation.
    private func createValidatedTextField(label: String, binding: Binding<String>, placeholder: String = "") -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(FontStyle.dmsansBold.font(baseSize: 11))
                .foregroundColor(AppColors.darkIndigoColor)
            
            TextField(placeholder, text: binding)
                .font(FontStyle.dmsansRegular.font(baseSize: 11))
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onChange(of: binding.wrappedValue) { newValue in
                    // This is the validation logic
                    let filtered = newValue.filter { $0.isLetter || $0.isWhitespace }
                    
                    if newValue != filtered {
                        print("Validation Error: Only letters and spaces are allowed.")
                        binding.wrappedValue = filtered
                    }
                }
        }
    }
    
    /// Creates the description text editor with validation and a placeholder.
    private func createValidatedTextEditor() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(FontStyle.dmsansBold.font(baseSize: 11))
                .foregroundColor(AppColors.darkIndigoColor)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $description)
                    .font(FontStyle.dmsansRegular.font(baseSize: 11))
                    .frame(minHeight: 150, maxHeight: .infinity)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .onChange(of: description) { newValue in
                        // Same validation logic for the description field
                        let filtered = newValue.filter { $0.isLetter || $0.isWhitespace }
                        if newValue != filtered {
                            print("Validation Error: Only letters and spaces are allowed.")
                            description = filtered
                        }
                    }
                
                // Placeholder Text
                if description.isEmpty {
                    Text("Write additional information here")
                        .font(FontStyle.dmsansBold.font(baseSize: 11))
                        .foregroundColor(AppColors.paleLavender)
                        .padding(16)
                        .allowsHitTesting(false)
                }
            }
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
