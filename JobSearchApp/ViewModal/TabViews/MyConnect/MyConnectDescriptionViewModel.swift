//
//  MyConnectDescriptionViewModel.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 17/03/25.
//

import Foundation
import Combine

enum SegmentedOption:String, CaseIterable{
    case aboutUs = "About Us"
    case post = "Post"
    case jobs = "Jobs"
}

class MyConnectDescriptionViewModel: ObservableObject {
    @Published var selected: SegmentedOption
    
    init(selected: SegmentedOption = .aboutUs){
        self.selected = selected
    }
    
}

