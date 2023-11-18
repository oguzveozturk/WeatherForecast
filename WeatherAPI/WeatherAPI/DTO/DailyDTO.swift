//
//  DailyDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Common

public struct DailyDTO {
   public let dt: Date
   public let sunrise: Int
   public let sunset: Int
   public let moonrise: Int
   public let moonset: Int
   public let moonPhase: Double
   public let temp: TempDTO
   public let feelsLike: FeelsLikeDTO
   public let pressure: Int
   public let humidity: Int
   public let dewPoint: Double
   public let windSpeed: Double
   public let windDeg: Int
   public let windGust: Double
   public let weather: [WeatherDTO]
   public let clouds: Int
   public let pop: Double
   public let rain: Double
   public let uvi: Double
    
    public init(dt: Date,
                sunrise: Int,
                sunset: Int,
                moonrise: Int,
                moonset: Int,
                moonPhase: Double,
                temp: TempDTO,
                feelsLike: FeelsLikeDTO,
                pressure: Int,
                humidity: Int,
                dewPoint: Double,
                windSpeed: Double,
                windDeg: Int,
                windGust: Double,
                weather: [WeatherDTO],
                clouds: Int,
                pop: Double,
                rain: Double,
                uvi: Double) {
        self.dt = dt
        self.sunrise = sunrise
        self.sunset = sunset
        self.moonrise = moonrise
        self.moonset = moonset
        self.moonPhase = moonPhase
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.windSpeed = windSpeed
        self.windDeg = windDeg
        self.windGust = windGust
        self.weather = weather
        self.clouds = clouds
        self.pop = pop
        self.rain = rain
        self.uvi = uvi
    }
    
    static var zero: DailyDTO {
        .init(dt: Date(),
              sunrise: 0,
              sunset: 0,
              moonrise: 0,
              moonset: 0,
              moonPhase: 0,
              temp: .zero,
              feelsLike: .zero,
              pressure: 0,
              humidity: 0,
              dewPoint: 0,
              windSpeed: 0,
              windDeg: 0,
              windGust: 0,
              weather: [],
              clouds: 0,
              pop: 0,
              rain: 0,
              uvi: 0)
    }
}

extension DailyDTO {
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE\nMMM, d"
        return dateFormatter
    }
    
    public var day: String {
        Self.dateFormatter.string(from: dt)
    }
    
    public var high: String {
        UserDefaults.tempatureUnit.convertTo(temp: temp.max)
    }
    
    public var low: String {
        UserDefaults.tempatureUnit.convertTo(temp: temp.min)
    }
}
