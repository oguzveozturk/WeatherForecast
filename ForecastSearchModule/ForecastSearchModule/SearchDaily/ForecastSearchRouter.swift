//
//  ForecastSearchRouter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit

enum ForecastSearchRoute {
    case hourlyDetail(ForecastHourlyBuilderData)
}

protocol ForecastSearchRouterProtocol: AnyObject {
    func present(route: ForecastSearchRoute)
}

final class ForecastSearchRouter: ForecastSearchRouterProtocol {
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func present(route: ForecastSearchRoute) {
        switch route {
        case .hourlyDetail(let builderData):
            let vc = ForecastHourlyBuilder.make(builderData)
            view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
