//
//  HourlyResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

struct HourlyResponse: Codable {
    let dt: Date?
    let temp: Double?
    let feelsLike: Double?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherResponse]?
    let pop: Double?
    let rain: RainResponse?
    
    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop, rain
    }
}

extension HourlyResponse {
    var asHourlyDTO: HourlyDTO {
        HourlyDTO(dt: dt ?? Date(),
                  temp: temp ?? 0,
                  feelsLike: feelsLike ?? 0,
                  pressure: pressure ?? 0,
                  humidity: humidity ?? 0,
                  dewPoint: dewPoint ?? 0,
                  uvi: uvi ?? 0,
                  clouds: clouds ?? 0,
                  visibility: visibility ?? 0,
                  windSpeed: windSpeed ?? 0,
                  windDeg: windDeg ?? 0,
                  windGust: windGust ?? 0,
                  weather: weather?.map { $0.asWeatherDTO } ?? [],
                  pop: pop ?? 0,
                  rain: rain?.asRainDTO ?? .zero)
    }
}
