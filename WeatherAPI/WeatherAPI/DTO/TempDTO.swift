//
//  TempDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct TempDTO {
   public let day: Double
   public let min: Double
   public let max: Double
   public let night: Double
   public let eve: Double
   public let morn: Double
    
    public init(day: Double,
                min: Double,
                max: Double,
                night: Double,
                eve: Double,
                morn: Double) {
        self.day = day
        self.min = min
        self.max = max
        self.night = night
        self.eve = eve
        self.morn = morn
    }
    
    static var zero: TempDTO {
        .init(day: 0,
              min: 0,
              max: 0,
              night: 0,
              eve: 0,
              morn: 0)
    }
}
