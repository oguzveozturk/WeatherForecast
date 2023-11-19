//
//  LocationManager.swift
//  LocationManager
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import CoreLocation

public enum LocationManagerOutput {
    case location((lat:Double, lon:Double))
    case showError(LocationError)
}

public protocol LocationManagerObserver: AnyObject {
    func locationDidReceive(result: LocationManagerOutput)
}

public protocol LocationManagerProtocol {
    var observer: LocationManagerObserver? { get set }
    
    func addObserver(_ observer: LocationManagerObserver)
    func geocodeAddress(for text: String?)
    func requestUserLocation()
}

public final class LocationManager: NSObject {
    weak public var observer: LocationManagerObserver?
    
    private let geoCoder: CLGeocoder
    private let locationManager: CLLocationManager
    
    public init(geoCoder: CLGeocoder = .init(),
                locationManager: CLLocationManager = .init()) {
        self.geoCoder = geoCoder
        self.locationManager = locationManager
        super.init()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    private func checkPermission(status: CLAuthorizationStatus) {
        switch status {
        case .denied, .restricted:
            observer?.locationDidReceive(result: .showError(.unauthorized))
        default: break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else { return }
        observer?.locationDidReceive(result: .location((location.latitude,location.longitude)))
    }
}

extension LocationManager: LocationManagerProtocol {
    public func addObserver(_ observer: LocationManagerObserver) {
        self.observer = observer
    }
    
    public func requestUserLocation() {
        locationManager.startUpdatingLocation()
        checkPermission(status: locationManager.authorizationStatus)
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkPermission(status: manager.authorizationStatus)
    }
    
    public func geocodeAddress(for text: String?) {
        guard let text = text, !text.isEmpty else { return }
        geoCoder.geocodeAddressString(text) { [weak self] (placemarks, error) in
            if let _ = error {
                self?.observer?.locationDidReceive(result: .showError(.locationNotFound))
            } else if let location = placemarks?.first?.location?.coordinate {
                self?.observer?.locationDidReceive(result: .location((location.latitude,location.longitude)))
            } else {
                self?.observer?.locationDidReceive(result: .showError(.noResponse))
            }
        }
    }
}
