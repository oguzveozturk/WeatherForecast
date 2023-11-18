//
//  DailyResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct DailyResponse: Codable {
    let dt: Date?
    let sunrise: Int?
    let sunset: Int?
    let moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: TempResponse?
    let feelsLike: FeelsLikeResponse?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherResponse]?
    let clouds: Int?
    let pop: Double?
    let rain: Double?
    let uvi: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, rain, uvi
    }
}

extension DailyResponse {
    var asDailyDTO: DailyDTO {
        DailyDTO(dt: dt ?? Date(),
                 sunrise: sunrise ?? 0,
                 sunset: sunset ?? 0,
                 moonrise: moonrise ?? 0,
                 moonset: moonset ?? 0,
                 moonPhase: moonPhase ?? 0,
                 temp: temp?.asTempDTO ?? .zero,
                 feelsLike: feelsLike?.asFeelsLikeDTO ?? .zero,
                 pressure: pressure ?? 0,
                 humidity: humidity ?? 0,
                 dewPoint: dewPoint ?? 0,
                 windSpeed: windSpeed ?? 0,
                 windDeg: windDeg ?? 0,
                 windGust: windGust ?? 0,
                 weather: weather?.map { $0.asWeatherDTO } ?? [],
                 clouds: clouds ?? 0,
                 pop: pop ?? 0,
                 rain: rain ?? 0,
                 uvi: uvi ?? 0)
    }
}
