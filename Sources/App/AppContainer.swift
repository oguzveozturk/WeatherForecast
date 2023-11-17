//
//  AppContainer.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = ForecastService()
}
