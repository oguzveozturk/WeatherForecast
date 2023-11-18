//
//  ForecastHourlyBuilder.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI
import UIKit

public struct ForecastHourlyBuilderData {
    let hourlyDTO: [HourlyDTO]
    let selectedDay: Date
}

public final class ForecastHourlyBuilder {
    public static func make(_ forecastHourlyBuilderData: ForecastHourlyBuilderData) -> UIViewController {
        let view = ForecastHourlyController()
        let presenter = ForecastHourlyPresenter(view: view, hourlyDTO: forecastHourlyBuilderData.hourlyDTO, selectedDay: forecastHourlyBuilderData.selectedDay)
        view.presenter = presenter
        return view
    }
}
