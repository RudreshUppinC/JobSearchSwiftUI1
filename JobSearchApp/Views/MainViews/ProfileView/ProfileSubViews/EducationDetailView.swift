//
//  EducationDetailView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 03/07/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct EducationDetailView: View {
    // MARK: - State Properties
    @State private var jobTitle: String = ""
    @State private var company: String = ""
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var description: String = ""
    @State private var isCurrentPosition: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Use a system color for the main background
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
                    .padding(.horizontal)

                    Text("Add Education ")
                        .font(.system(.title2, design: .default).bold())
                        .foregroundColor(.primary)

                    // MARK: - Form Fields
                    VStack(alignment: .leading, spacing: 20) {
                        createValidatedTextField(label: "Level of Education", binding: $jobTitle)
                        createValidatedTextField(label: "Field of Study", binding: $jobTitle)
                        createValidatedTextField(label: "Institution Name", binding: $jobTitle)
                        createValidatedTextField(label: "", binding: $company)
                        
                        HStack(spacing: 16) {
                            createValidatedTextField(label: "Start date", binding: $startDate, placeholder: "")
                            createValidatedTextField(label: "End date", binding: $endDate, placeholder: "")
                                .disabled(isCurrentPosition)
                                .opacity(isCurrentPosition ? 0.5 : 1.0)
                        }
                        
                        createCheckbox()
                        
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
                                .background(Color(red: 0.145, green: 0.145, blue: 0.345)) // Dark blue color
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 15)
                    
                }
                .cornerRadius(30)
                .shadow(color: AppColors.black.opacity(0.05), radius: 10, x: 0, y: 5)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    // MARK: - UI Helper Methods
    
    /// Creates a labeled text field with letter-only validation.
    private func createValidatedTextField(label: String, binding: Binding<String>, placeholder: String = "") -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(.subheadline, design: .default).bold())
                .foregroundColor(.primary)
            
            TextField(placeholder, text: binding)
                .font(.system(.body, design: .default))
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
                .font(.system(.subheadline, design: .default).bold())
                .foregroundColor(.primary)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $description)
                    .font(.system(.body, design: .default))
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
                        .font(.system(.body, design: .default))
                        .foregroundColor(Color(.placeholderText))
                        .padding(16)
                        .allowsHitTesting(false)
                }
            }
        }
    }
    
    /// Creates the checkbox toggle.
    private func createCheckbox() -> some View {
        Toggle(isOn: $isCurrentPosition) {
            Text("This is my position now")
                .font(.system(.body, design: .default))
                .foregroundColor(.secondary)
        }
        .toggleStyle(CheckboxToggleStyle())
    }
}

