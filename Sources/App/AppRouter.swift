//
//  AppRouter.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import ForecastSearchModule
import DependecyManagerKit
import WeatherAPI

final class AppRouter {
    @Dependency var forecastSearchModule: ForecastSearchModuleInterface
    @Dependency var forecastService: ForecastServiceable
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let viewController = forecastSearchModule.forecastSearchController(service: forecastService)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
