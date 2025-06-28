import SwiftUI


enum Tab: Int, CaseIterable {
    case home
    case connect
    case post
    case chat
    case bookmark

    var imageNameSelected: String {
        switch self {
        case .home: return "homeSelect"
        case .connect: return "reconnectSelect"
        case .post: return "postSelect"
        case .chat: return "chatSelect"
        case .bookmark: return "bookmarkSelect"
        }
    }
       

    var imageNameUnselected: String {
        switch self {
        case .home: return "homeUnSelect"
        case .connect: return "reconnectUnSelect"
        case .post: return "postSelect"
        case .chat: return "chatUnSelect"
        case .bookmark: return "bookmarkUnSelect"
        }
    }
}

