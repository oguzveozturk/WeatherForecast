//
//  ForecastSearchInteractor.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI

enum ForecastSearchInteractorOutput {
    case showForecast(ForecastDTO)
    case showError(Error)
}

protocol ForecastSearchInteractorProtocol: AnyObject {
    var output: ForecastSearchInteractorDelegate? { get set }
    func search(lat: Double, lon: Double) async
}

protocol ForecastSearchInteractorDelegate: AnyObject {
    func handle(_ output: ForecastSearchInteractorOutput)
}

final class ForecastSearchInteractor: ForecastSearchInteractorProtocol {
    var output: ForecastSearchInteractorDelegate?
    
    private let service: ForecastService
    
    init(service: ForecastService) {
        self.service = service
    }
    
    func search(lat: Double, lon: Double) async {
        let result = await service.search(parameter: .init(lat: lat,
                                                           lon: lon,
                                                           formats: [.daily, .hourly]))
        switch result {
        case .success(let response):
            output?.handle(.showForecast(response))
        case .failure(let err):
            output?.handle(.showError(err))
        }
    }
}
