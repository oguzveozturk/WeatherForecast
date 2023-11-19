//
//  Dependencies.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import WeatherAPI
import DependecyManagerKit
import ForecastSearchModule

final class Dependencies {
    let service = ForecastService()
    
    func registerAll() {
        DependencyManager.shared.register(value: ForecastSearchModule(),
                                          for: ForecastSearchModuleInterface.self)
    }
}
