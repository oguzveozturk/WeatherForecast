//
//  AppContainer.swift
//  WeatherForecast
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import NetworkService
import WeatherAPI
import UIKit
import Common

final class AppContainer {
    let router: AppRouter
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        router = AppRouter(window: window)
        configureNetworkService()
    }
    
    private func configureNetworkService() {
        struct Configuration: Decodable {
            let scheme: String
            let host: String
        }
        let config: Configuration = try! PropertyListParser.read(fileName: "Configuration")
        NetworkConfig.set(scheme: config.scheme, host: config.host)
        
        struct APIKeys: Decodable {
            let appid: String
        }
        let apiKeys: APIKeys = try! PropertyListParser.read(fileName: "APIKeys")
        WeatherAPIConfig.set(apiKey: apiKeys.appid)
    }
}
