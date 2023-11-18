//
//  ForecastBaseCellPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

protocol ForecastSearchResultCellPresenterProtocol: AnyObject {
    associatedtype DTO
    var dto: DTO { get set }
    func load()
}

final class ForecastBaseCellPresenter<DTO>: ForecastSearchResultCellPresenterProtocol {
    var dto: DTO
    private weak var view: (any ForecastSearchResultCellProtocol)?

    func load() {
        view?.setupLayout()
        view?.configure()
    }
    
    init(dto: DTO, view: any ForecastSearchResultCellProtocol) {
        self.dto = dto
        self.view = view
    }
}
