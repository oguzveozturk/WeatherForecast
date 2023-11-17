//
//  ForecastParameter.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import Foundation

public struct ForecastParameter: Codable, Hashable {
    let lat: Double
    let lon: Double
    
    public init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}
