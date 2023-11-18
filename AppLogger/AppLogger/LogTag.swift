//
//  LogTag.swift
//  AppLogger
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

public enum LogTag {
    
    case error
    case warning
    case success
    case debug
    case network
    case simOnly
    case responses
    case decoded
    case locals
    
    var label: String {
        switch self {
        case .error:     return "[APP ERROR 🔴]"
        case .warning:   return "[APP WARNING 🟠]"
        case .success:   return "[APP SUCCESS 🟢]"
        case .debug:     return "[APP DEBUG 🔵]"
        case .network:   return "[APP NETWORK 🌍]"
        case .simOnly:   return "[APP SIMULATOR ONLY 🤖]"
        case .responses: return "[APP RESPONSE 💎]"
        case .decoded:   return "[APP DECODED 🧿]"
        case .locals:    return "[APP LOCALS ⛏️]"
        }
    }
}
