//
//  ForecastSearchModule.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import UIKit
import WeatherAPI

public protocol ForecastSearchModuleInterface: AnyObject {
    func forecastSearchController(service: ForecastServiceable) -> UIViewController
}

public class ForecastSearchModule {
    public init() {}
}

// MARK: - MovieModuleInterface
extension ForecastSearchModule: ForecastSearchModuleInterface {
    public func forecastSearchController(service: ForecastServiceable) -> UIViewController {
        ForecastSearchBuilder.make(service: service)
    }
}
