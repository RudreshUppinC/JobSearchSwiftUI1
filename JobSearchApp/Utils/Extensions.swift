////
////  Extensions.swift
////  Claude
////
////  Created by Way2 on 21/02/25.
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
//    func centeredStyle(padding: CGFloat = 5, backgroundColor: Color = .white, cornerRadius: CGFloat = 20, font: Font = .body) -> some View {
//        self
//            .padding(padding)
//            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor))
//            .multilineTextAlignment(.center)
//            .font(font) 
//    }
//}
//
//// Extension for TextField
//extension TextField {
//    func centeredStyle(padding: CGFloat = 5, backgroundColor: Color = .white, cornerRadius: CGFloat = 20, font: Font = .body) -> some View {
//        self
//            .padding(padding)
//            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor))
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
