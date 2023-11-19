//
//  LocationError.swift
//  LocationManager
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

public enum LocationError: Error {
    case unauthorized
    case noResponse
    case locationNotFound
    case unknown
    
    public var customMessage: String {
        switch self {
        case .noResponse:
            return "Session expired"
        case .unauthorized:
            return "Give us location permission to identify current weather"
        case .locationNotFound:
            return "Location not found"
        default:
            return "Unknown error"
        }
    }
}
