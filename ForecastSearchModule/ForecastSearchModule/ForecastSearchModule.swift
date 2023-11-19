//
//  ForecastSearchModule.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import DependecyManagerKit
import UIKit
import WeatherAPI

public class ForecastSearchModule {
    public init() {}
}

// MARK: - MovieModuleInterface
extension ForecastSearchModule: ForecastSearchModuleInterface {
    public func forecastSearchController(service: ForecastService) -> UIViewController {
        ForecastSearchBuilder.make(service: service)
    }
}
