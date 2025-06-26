//
//  FontStyle.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import Foundation
import SwiftUI

import SwiftUI

enum FontStyle: String {
   
    case dmsansBold = "DMSans-Bold"
    case dmsansRegular = "DMSans-Regular"
    case dmsansMedium = "DMSans-Medium"
   
    func font(baseSize: CGFloat) -> Font {
       
        let scaleFactor = FontStyle.dynamicScaleFactor()
        let dynamicSize = baseSize * scaleFactor
        
        return .custom(self.rawValue, size: dynamicSize)
    }

    static func dynamicScaleFactor() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        
        if screenWidth > 375 {
            return 1.2
        } else {
            return 1.0
        }
    }

    static func defaultSize(for style: FontStyle) -> CGFloat {
        switch style {
        case .dmsansBold:
            return 20
        case .dmsansRegular:
            return 18
        case .dmsansMedium:
            return 18
        
        }
    }
}
