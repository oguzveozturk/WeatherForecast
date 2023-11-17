//
//  ForecastSearchInteractor.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI
import CoreLocation

enum ForecastSearchInteractorOutput {
    case showForecast(ForecastDTO)
    case showError(Error)
}

protocol ForecastSearchInteractorProtocol: AnyObject {
    var delegate: ForecastSearchInteractorDelegate? { get set }
    func search(for coordinates: CLLocationCoordinate2D) async
}

protocol ForecastSearchInteractorDelegate: AnyObject {
    func handleOutput(_ output: ForecastSearchInteractorOutput)
}

final class ForecastSearchInteractor: ForecastSearchInteractorProtocol {
    var delegate: ForecastSearchInteractorDelegate?
    
    private let service: ForecastService!
    
    init(service: ForecastService) {
        self.service = service
    }
    
    func search(for coordinates: CLLocationCoordinate2D) async {
        let result = await service.search(parameter: .init(lat: coordinates.latitude,
                                                           lon: coordinates.longitude,
                                                           formats: [.daily, .hourly]))
        DispatchQueue.main.async { [weak self] in
            switch result {
            case .success(let response):
                self?.delegate?.handleOutput(.showForecast(response))
            case .failure(let err):
                self?.delegate?.handleOutput(.showError(err))
            }
        }
    }
}
