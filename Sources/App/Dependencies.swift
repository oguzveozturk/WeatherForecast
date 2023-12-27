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
    func registerAll() {
        DependencyManager.shared.register(value: ForecastSearchModule(),
                                          for: ForecastSearchModuleInterface.self)
        DependencyManager.shared.register(value: ForecastService(),
                                          for: ForecastServiceable.self)
    }
}
