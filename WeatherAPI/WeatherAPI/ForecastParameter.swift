//
//  ForecastParameter.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import Foundation

public enum Format: String, CaseIterable, Codable {
    case daily, hourly, minutely, current, alerts
}

public struct ForecastParameter: Codable, Hashable {
    let lat: Double
    let lon: Double
    let formats: [Format]
    
    public init(lat: Double, lon: Double, formats: [Format]) {
        self.lat = lat
        self.lon = lon
        self.formats = formats
    }
}

extension ForecastParameter {
    var excludes: [String] {
        Format.allCases.compactMap { (format) -> (String?) in
            guard !formats.contains(format) else { return nil }
            return format.rawValue
        }
        
    }
}
