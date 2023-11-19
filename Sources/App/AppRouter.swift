//
//  AppRouter.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import ForecastSearchModule
import DependecyManagerKit

final class AppRouter {
    @Dependency var forecastSearchModule: ForecastSearchModuleInterface
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start(dependencies: Dependencies) {
        let viewController = forecastSearchModule.forecastSearchController(service: dependencies.service)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
