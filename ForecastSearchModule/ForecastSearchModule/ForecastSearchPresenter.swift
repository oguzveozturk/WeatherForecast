//
//  ForecastSearchPresenter.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import WeatherAPI
import CoreLocation

protocol ForecastSearchPresenterProtocol: AnyObject {
    var dailyResults:[DailyDTO] { get set }
    func load()
    func search(for location: CLLocationCoordinate2D)
    func geocodeAddress(for text: String?)
}

final class ForecastSearchPresenter: NSObject, ForecastSearchPresenterProtocol {
    private let view: ForecastSearchViewProtocol!
    private let interactor: ForecastSearchInteractorProtocol!
    private let router: ForecastSearchRouterProtocol!
    var dailyResults = [DailyDTO]()
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        return manager
    }()
    
    init(view: ForecastSearchViewProtocol,
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
        view.searchForCurrentLocation()
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
}

extension ForecastSearchPresenter: ForecastSearchInteractorDelegate {
    func handleOutput(_ output: ForecastSearchInteractorOutput) {
        view.hideIndicator()
        switch output {
        case .showDailyResults(let array):
            dailyResults = array
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
