//
//  ForecastDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import Foundation

public struct ForecastDTO {
    public let lat: Double
    public let lon: Double
    public let timezone: String
    public let timezoneOffset: Int
    public let hourly: [HourlyDTO]
    public let daily: [DailyDTO]
    
    public init(lat: Double,
                lon: Double,
                timezone: String,
                timezoneOffset: Int,
                hourly: [HourlyDTO],
                daily: [DailyDTO]) {
        self.lat = lat
        self.lon = lon
        self.timezone = timezone
        self.timezoneOffset = timezoneOffset
        self.hourly = hourly
        self.daily = daily
    }
}
