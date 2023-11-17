//
//  ForecastHourlyPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

protocol ForecastHourlyPresenterProtocol {
    var hourlyDTO: [HourlyDTO] { get set }
    var currentDay: Date { get set }
    func load()
}

final class ForecastHourlyPresenter {
    private let view: ForecastHourlyControllerProtocol!
    var hourlyDTO: [HourlyDTO] = []
    var currentDay: Date = .init()
    
    init(view: ForecastHourlyControllerProtocol,
         hourlyDTO: [HourlyDTO],
         currentDay: Date) {
        self.view = view
        self.hourlyDTO = hourlyDTO
        self.currentDay = currentDay
    }
}


extension ForecastHourlyPresenter: ForecastHourlyPresenterProtocol {
    func load() {
        view.setTitle(text: currentDay.formatted())
    }
}
