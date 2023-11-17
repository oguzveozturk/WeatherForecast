//
//  ForecastServiceMock.swift
//  WeatherAPITests
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import NetworkService
import Common
import WeatherAPI

final class ForecastServiceMock: Mockable, ForecastServiceable {
    func search(parameter: ForecastParameter) async -> Result<ForecastDTO, RequestError> {
        return .success(loadJSON(filename: "current_weather", type: ForecastResponse.self).asForecastDTO)
    }
}
