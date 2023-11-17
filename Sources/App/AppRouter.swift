//
//  AppRouter.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import ForecastSearchModule

final class AppRouter {
    var window: UIWindow?

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = ForecastSearchBuilder.make(service: app.service)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
