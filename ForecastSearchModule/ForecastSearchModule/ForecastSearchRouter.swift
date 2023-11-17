//
//  ForecastSearchRouter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit

enum ForecastSearchRoute {
    case hourlyDetail
}

protocol ForecastSearchRouterProtocol: AnyObject {
    func present(route: ForecastSearchRoute)
}

final class ForecastSearchRouter: ForecastSearchRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func present(route: ForecastSearchRoute) {
        switch route {
        case .hourlyDetail:
            break
        }
    }
}
