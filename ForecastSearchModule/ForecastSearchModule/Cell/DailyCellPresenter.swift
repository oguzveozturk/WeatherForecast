//
//  DailyCellPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

protocol ForecastSearchResultCellPresenterProtocol: AnyObject {
    func load()
}

final class DailyCellPresenter: ForecastSearchResultCellPresenterProtocol {
    let dailyDTO: DailyDTO
    private weak var view: (any ForecastSearchResultCellProtocol)?

    func load() {
        view?.setupLayout()
        view?.configure()
    }
    
    init(dailyDTO: DailyDTO, view: any ForecastSearchResultCellProtocol) {
        self.dailyDTO = dailyDTO
        self.view = view
    }
}
