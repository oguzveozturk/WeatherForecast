//
//  HourlyCellPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

final class HourlyCellPresenter: ForecastSearchResultCellPresenterProtocol {
    let hourlyDTO: HourlyDTO
    private weak var view: (any ForecastSearchResultCellProtocol)?

    func load() {
        view?.setupLayout()
        view?.configure()
    }
    
    init(hourlyDTO: HourlyDTO, view: any ForecastSearchResultCellProtocol) {
        self.hourlyDTO = hourlyDTO
        self.view = view
    }
}
