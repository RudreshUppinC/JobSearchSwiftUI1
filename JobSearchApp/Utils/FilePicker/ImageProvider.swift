//
//  ImageProvider.swift
//  JobSearchApp
//
//  Created by DarkMoon on 30/03/25.
//

import Foundation
// ImageProvider.swift
import UIKit

class ImageProvider {

    static func getImage(named imageName: String) -> UIImage? {
        // Try to load the requested image
        if let image = UIImage(named: imageName) {
            return image
            
        }
        return UIImage(named: "DefaultImage")
    }
}
