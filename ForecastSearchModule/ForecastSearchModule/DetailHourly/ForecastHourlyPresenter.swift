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
    func setEmptyMessageIfNeeded()
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
        view.setTitle(text: currentDay.formatted(date: .complete, time: .omitted))
        hourlyDTO = hourlyDTO.filter { Calendar.current.isDate(currentDay, equalTo: $0.dt, toGranularity: .day) }
        setEmptyMessageIfNeeded()
    }
    
    func setEmptyMessageIfNeeded() {
        if hourlyDTO.isEmpty {
            view.setEmptyMessage(text: "Hourly detail is only available for 48 hours")
        }
    }
}
