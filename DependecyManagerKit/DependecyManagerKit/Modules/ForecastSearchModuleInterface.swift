//
//  ForecastSearchModuleInterface.swift
//  DependecyManagerKit
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import UIKit
import WeatherAPI

public protocol ForecastSearchModuleInterface: AnyObject {
    func forecastSearchController(service: ForecastService) -> UIViewController
}
