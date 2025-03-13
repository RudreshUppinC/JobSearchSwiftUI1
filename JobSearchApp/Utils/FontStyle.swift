//
//  FontStyle.swift
//  JobSearchApp
//
//  Created by Way2 on 27/02/25.
//

import Foundation
import SwiftUI

import SwiftUI

// Define an enum to represent different font styles
enum FontStyle: String {
    case dmsansBold = "DMSans-Bold"
    case dmsansRegular = "DMSans-Regular"
    
    // A computed property to return the custom Font with dynamic scaling
    func font(baseSize: CGFloat) -> Font {
        // Get the dynamic scale factor
        let scaleFactor = FontStyle.dynamicScaleFactor()
        let dynamicSize = baseSize * scaleFactor // Apply the scale factor to base size
        
        return .custom(self.rawValue, size: dynamicSize) // Return custom font with dynamic size
    }

    // Dynamically adjust font size based on screen size or other conditions
    static func dynamicScaleFactor() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        // Example of dynamic scaling factor based on screen width
        if screenWidth > 375 {
            return 1.2 // Larger scale factor for bigger screens
        } else {
            return 1.0 // Default scale factor for smaller screens
        }
    }

    // Optionally, you can define default base sizes for each font style
    static func defaultSize(for style: FontStyle) -> CGFloat {
        switch style {
        case .dmsansBold:
            return 20
        case .dmsansRegular:
            return 18
        }
    }
}
