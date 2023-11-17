//
//  HourlyDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct HourlyDTO {
   public let dt: Date
   public let temp: Double
   public let feelsLike: Double
   public let pressure: Int
   public let humidity: Int
   public let dewPoint: Double
   public let uvi: Double
   public let clouds: Int
   public let visibility: Int
   public let windSpeed: Double
   public let windDeg: Int
   public let windGust: Double
   public let weather: [WeatherDTO]
   public let pop: Double
   public let rain: RainDTO
    
    public init(dt: Date,
                temp: Double,
                feelsLike: Double,
                pressure: Int,
                humidity: Int,
                dewPoint: Double,
                uvi: Double,
                clouds: Int,
                visibility: Int,
                windSpeed: Double,
                windDeg: Int,
                windGust: Double,
                weather: [WeatherDTO],
                pop: Double,
                rain: RainDTO) {
        self.dt = dt
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.uvi = uvi
        self.clouds = clouds
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.windDeg = windDeg
        self.windGust = windGust
        self.weather = weather
        self.pop = pop
        self.rain = rain
    }
    
   public static var zero: HourlyDTO {
        .init(dt: Date(),
              temp: 0,
              feelsLike: 0,
              pressure: 0,
              humidity: 0,
              dewPoint: 0,
              uvi: 0,
              clouds: 0,
              visibility: 0,
              windSpeed: 0,
              windDeg: 0,
              windGust: 0,
              weather: [],
              pop: 0,
              rain: .zero)
    }
}

extension HourlyDTO {
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        return dateFormatter
    }
    
    private static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    private static var numberFormatter2: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter
    }

    func convert(_ temp: Double, isCelcius: Bool = true) -> Double {
        let celsius = temp - 273.5
        return isCelcius ? celsius : (celsius * 9 / 5 + 32)
    }
    
    public var day: String {
        return Self.dateFormatter.string(from: dt)
    }
    
    public var popStr: String {
        return "💧\(Self.numberFormatter2.string(for: pop) ?? "0%")"
    }
    
    public var cloudsStr: String {
        return "☁️\(clouds)%"
    }

    public var humidityStr: String {
        return "Humidity: \(humidity)%"
    }
}
