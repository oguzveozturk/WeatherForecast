//
//  FeelsLikeDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct FeelsLikeDTO {
   public let day: Double
   public let night: Double
   public let eve: Double
   public let morn: Double
    
    public init(day: Double,
                night: Double,
                eve: Double,
                morn: Double) {
        self.day = day
        self.night = night
        self.eve = eve
        self.morn = morn
    }
    
    static var zero: FeelsLikeDTO {
        .init(day: 0, night: 0, eve: 0, morn: 0)
    }
}
