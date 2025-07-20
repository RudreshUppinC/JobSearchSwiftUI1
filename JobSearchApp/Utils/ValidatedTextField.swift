//
//  ValidatedTextField.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 20/07/25.
//


import SwiftUI

struct ValidatedTextField: View {
    
    // MARK: - Properties
    
    let label: String
    let placeholder: String
    
    @Binding var text: String
    
    // MARK: - Initializer
    init(
        _ label: String,
        text: Binding<String>,
        placeholder: String = ""
    ) {
        self.label = label
        self._text = text
        self.placeholder = placeholder
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Label Text
            Text(label)
                .font(FontStyle.dmsansBold.font(baseSize: 12))
                .foregroundColor(AppColors.darkIndigoColor)
            
            // The TextField
            TextField(placeholder, text: $text)
                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                .foregroundColor(AppColors.dustyLavender)
                .padding(12)
                .background(AppColors.white)
                .cornerRadius(8)
                .onChange(of: text) { newValue in
                    
                    let filtered = newValue.filter { $0.isLetter || $0.isWhitespace }
                    
                    if newValue != filtered {
                        print("Validation Error: Only letters and spaces are allowed.")
                        // Directly update the binding. SwiftUI handles the rest.
                        text = filtered
                    }
                }
        }
    }
}
