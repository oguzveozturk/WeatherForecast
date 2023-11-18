//
//  ForecastResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import Foundation
import Common

struct ForecastResponse: Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let hourly: [HourlyResponse]?
    let daily: [DailyResponse]?
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case hourly, daily
    }
}

extension ForecastResponse {
    var asForecastDTO: ForecastDTO {
        ForecastDTO(lat: lat ?? 0,
                    lon: lon ?? 0,
                    timezone: timezone ?? "",
                    timezoneOffset: timezoneOffset ?? 0,
                    hourly: hourly?.map { $0.asHourlyDTO } ?? [],
                    daily: daily?.map { $0.asDailyDTO } ?? [])
    }
}
