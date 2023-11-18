//
//  ForecastHourlyPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

protocol ForecastHourlyPresenterProtocol {
    var hourlyDTO: [HourlyDTO] { get set }
    var selectedDay: Date { get set }
    
    func load()
    func setEmptyMessageIfNeeded()
    func filterForSelectedDay()
}

private extension ForecastHourlyPresenter {
    enum Constants {
        static let emptyMessage = "Hourly detail is only available for 48 hours"
    }
}

final class ForecastHourlyPresenter {
    private let view: ForecastHourlyControllerProtocol!
    var hourlyDTO: [HourlyDTO] = []
    var selectedDay: Date = .init()
    
    init(view: ForecastHourlyControllerProtocol,
         hourlyDTO: [HourlyDTO],
         selectedDay: Date) {
        self.view = view
        self.hourlyDTO = hourlyDTO
        self.selectedDay = selectedDay
    }
}


extension ForecastHourlyPresenter: ForecastHourlyPresenterProtocol {
    func load() {
        view.setTitle(text: selectedDay.formatted(date: .complete, time: .omitted))
        filterForSelectedDay()
        setEmptyMessageIfNeeded()
    }
    
    func filterForSelectedDay() {
        hourlyDTO = hourlyDTO.filter { Calendar.current.isDate(selectedDay, equalTo: $0.dt, toGranularity: .day) }
    }
    
    func setEmptyMessageIfNeeded() {
        if hourlyDTO.isEmpty {
            view.setEmptyMessage(text: Constants.emptyMessage)
        }
    }
}
