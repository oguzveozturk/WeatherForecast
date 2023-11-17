//
//  WeatherResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

struct WeatherResponse: Codable {
    let id: Int?
    let main: MainWeather?
    let description: String?
    let icon: String?
}

extension WeatherResponse {
    var asWeatherDTO: WeatherDTO {
        WeatherDTO(id: id ?? 0,
              main: main ?? .clear,
              description: description ?? "",
              icon: icon ?? "")
    }
}

public enum MainWeather: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case thunderstorm = "Thunderstorm"
    case snow = "Snow"
    case drizzle = "Drizzle"
    case mist = "Mist"
    case smoke = "Smoke"
    case haze = "Haze"
    case dust = "Dust"
    case fog = "Fog"
    case sand = "Sand"
    case ash = "Ash"
    case squall = "Squall"
    case tornado = "Tornado"
}
