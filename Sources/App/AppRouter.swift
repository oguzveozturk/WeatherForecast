//
//  AppRouter.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit

final class AppRouter {
    var window: UIWindow?

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
