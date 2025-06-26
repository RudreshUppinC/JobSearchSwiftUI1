////
////  Extensions.swift
////  Claude
////
////  Created by Rudresh Jaya on 21/02/25.
////
//
//import UIKit
//import SwiftUI
//
//extension Color{
//    static let color1 = LinearGradient(gradient: Gradient(colors: [Color(.pink.opacity(0.3)),Color(.blue.opacity(0.8))]), startPoint: .topLeading, endPoint: .bottomTrailing)
//    
//}
//
//import SwiftUI
//
//// Extension for SecureField
//extension SecureField {
//    func centeredStyle(padding: CGFloat = 5, lightGrayBlue: Color = .white, cornerRadius: CGFloat = 20, font: Font = .body) -> some View {
//        self
//            .padding(padding)
//            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(lightGrayBlue))
//            .multilineTextAlignment(.center)
//            .font(font) 
//    }
//}
//
//// Extension for TextField
//extension TextField {
//    func centeredStyle(padding: CGFloat = 5, lightGrayBlue: Color = .white, cornerRadius: CGFloat = 20, font: Font = .body) -> some View {
//        self
//            .padding(padding)
//            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(lightGrayBlue))
//            .multilineTextAlignment(.center)
//            .font(font)
//    }
//}

import SwiftUI

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")

        var baseValue: UInt64 = 0
        Scanner(string: cleanHexCode).scanHexInt64(&baseValue)

        let mask = 0x000000FF
        let r = Int(baseValue >> (8*2)) & mask
        let g = Int(baseValue >> (8*1)) & mask
        let b = Int(baseValue >> (8*0)) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}


extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, message: String, duration: TimeInterval = 2.0) -> some View {
        self.modifier(
            ToastModifier(isShowing: isShowing, message: message, duration: duration)
        )
    }
}

extension Date {
    func formattedForResumeUpload() -> String {
        return Formatters.resumeUploadFormat.string(from: self)
    }
    
    func formattedForMonthYear() -> String {
        return Formatters.monthYear.string(from: self)
    }
}

struct Formatters {
    static let monthYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter
    }()
    
    static let resumeUploadFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "d MMM yyyy 'at' h:mm a"
           return formatter
    }()
}
