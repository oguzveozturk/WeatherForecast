//
//  AppRouter.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import ForecastSearchModule

final class AppRouter {
    func start(window: UIWindow?, dependencies: Dependencies) {
        let viewController = ForecastSearchBuilder.make(service: dependencies.service)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
