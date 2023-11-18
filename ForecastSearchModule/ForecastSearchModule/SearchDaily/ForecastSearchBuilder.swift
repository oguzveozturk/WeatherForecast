//
//  ForecastSearchBuilder.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI
import LocationManager

public final class ForecastSearchBuilder {
    public static func make(service: ForecastService) -> ForecastSearchController {
        let view = ForecastSearchController()
        let router = ForecastSearchRouter(view: view)
        let interactor = ForecastSearchInteractor(service: service)
        let locationManager = LocationManager()
        let presenter = ForecastSearchPresenter(view: view,
                                                interactor: interactor,
                                                router: router,
                                                locationManager: locationManager)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}
