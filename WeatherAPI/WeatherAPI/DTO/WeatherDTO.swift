//
//  WeatherDTO.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct WeatherDTO {
   public let id: Int
   public let main: MainWeather
   public let description: String
   public let icon: String
    
   public init(id: Int,
               main: MainWeather,
               description: String,
               icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
    
    static var zero: WeatherDTO {
        .init(id: 0,
              main: .clear,
              description: "",
              icon: "")
    }
}

extension Array where Element == WeatherDTO {
    public var mainZip: String {
        map { $0.main.rawValue }.joined(separator: ", ")
    }
    public var descZip: String {
        map { $0.description }.joined(separator: ", ")
    }
    public var firstImage: URL? {
        guard let icon = first?.icon else { return nil }
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
