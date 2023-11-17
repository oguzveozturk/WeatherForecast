//
//  RainDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct RainDTO {
    public let the1H: Double
    
    public init(the1H: Double) {
        self.the1H = the1H
    }
    
    static var zero: RainDTO {
        .init(the1H: 0)
    }
}
