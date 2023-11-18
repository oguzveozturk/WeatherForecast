//
//  ForecastSearchPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import struct WeatherAPI.ForecastDTO
import LocationManager
import Common

protocol ForecastSearchPresenterProtocol: AnyObject {
    var forecastDTO: ForecastDTO { get set }
    
    func load()
    func search(lat: Double, lon: Double)
    func updateUnit(_ unit: TempatureUnit)
    func geocodeAddress(for text: String?)
    func didSelect(item at: Int)
}

final class ForecastSearchPresenter: ForecastSearchPresenterProtocol {
    private let view: ForecastSearchControllerProtocol!
    private let interactor: ForecastSearchInteractorProtocol!
    private let router: ForecastSearchRouterProtocol!
    private let locationManager: LocationManagerProtocol
    var forecastDTO: ForecastDTO = .zero
    
    init(view: ForecastSearchControllerProtocol,
         interactor: ForecastSearchInteractorProtocol,
         router: ForecastSearchRouterProtocol,
         locationManager: LocationManagerProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
        self.locationManager = locationManager
    }
    
    func load() {
        locationManager.addObserver(self)
        locationManager.requestUserLocation()
    }
    
    func updateUnit(_ unit: TempatureUnit) {
        UserDefaults.tempatureUnit = unit
        view.setBarMenuTitle(unit.rawValue.capitalized)
        view.reloadData()
    }
    
    func search(lat: Double, lon: Double) {
        Task {
            await interactor.search(lat: lat, lon: lon)
        }
    }
    
    func geocodeAddress(for text: String?) {
        view.showIndicator()
        locationManager.geocodeAddress(for: text)
    }
    
    func didSelect(item at: Int) {
        let selectedDay = forecastDTO.daily[at].dt
        router.present(route: .hourlyDetail(.init(hourlyDTO: forecastDTO.hourly,
                                                  selectedDay: selectedDay)))
    }
}

extension ForecastSearchPresenter: ForecastSearchInteractorDelegate {
    func handle(_ output: ForecastSearchInteractorOutput) {
        view.hideIndicator()
        switch output {
        case .showForecast(let forecast):
            forecastDTO = forecast
            view.reloadData()
        case .showError(let error):
            view.showAlert(message: error.localizedDescription)
        }
    }
}

extension ForecastSearchPresenter: LocationManagerObserver {
    func locationDidReceive(lat: Double, lon: Double) {
        search(lat: lat, lon: lon)
    }
    
    func locationDidReceive(error: Error) {
        view.showAlert(message: error.localizedDescription)
    }
}
