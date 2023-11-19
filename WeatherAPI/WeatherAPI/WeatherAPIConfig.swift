//
//  WeatherAPIConfig.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

public class WeatherAPIConfig {
    static var apiKey: String = ""
    
    public static func set(apiKey: String) {
        Self.apiKey = apiKey
    }
}
