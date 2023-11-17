//
//  ForecastSearchPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI
import CoreLocation

protocol ForecastSearchPresenterProtocol: AnyObject {
    var forecastDTO: ForecastDTO { get set }
    func load()
    func search(for location: CLLocationCoordinate2D)
    func geocodeAddress(for text: String?)
    func didSelect(item at: Int)
}

final class ForecastSearchPresenter: NSObject, ForecastSearchPresenterProtocol {
    private let view: ForecastSearchControllerProtocol!
    private let interactor: ForecastSearchInteractorProtocol!
    private let router: ForecastSearchRouterProtocol!
    var forecastDTO: ForecastDTO = .zero
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        return manager
    }()
    
    init(view: ForecastSearchControllerProtocol,
         interactor: ForecastSearchInteractorProtocol,
         router: ForecastSearchRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
        super.init()
        self.interactor.delegate = self
    }
    
    func load() {
        locationManager.startUpdatingLocation()
    }
    
    func search(for location: CLLocationCoordinate2D) {
        Task {
            await interactor.search(for: location)
        }
    }
    
    func geocodeAddress(for text: String?) {
        guard let text = text, !text.isEmpty else { return }
        view.showIndicator()
        CLGeocoder().geocodeAddressString(text) { [weak self] (placemarks, error) in
            guard let location = placemarks?.first?.location?.coordinate else { return }
            self?.search(for: location)
        }
    }
    
    func didSelect(item at: Int) {
        let selectedDay = forecastDTO.daily[at].dt
        router.present(route: .hourlyDetail(.init(hourlyDTO: forecastDTO.hourly,
                                                  selectedDay: selectedDay)))
    }
}

extension ForecastSearchPresenter: ForecastSearchInteractorDelegate {
    func handleOutput(_ output: ForecastSearchInteractorOutput) {
        view.hideIndicator()
        switch output {
        case .showForecast(let forecast):
            forecastDTO = forecast
            view.reloadData()
        case .showError(let error):
            view.presentAlert(text: error.localizedDescription)
        }
    }
}

extension ForecastSearchPresenter: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        search(for: location.coordinate)
    }
}
