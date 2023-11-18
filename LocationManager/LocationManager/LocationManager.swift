//
//  LocationManager.swift
//  LocationManager
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import CoreLocation

public protocol LocationManagerObserver: AnyObject {
    func locationDidReceive(lat: Double, lon: Double)
}

public protocol LocationManagerProtocol {
    var observer: LocationManagerObserver? { get set }
    
    func addObserver(_ observer: LocationManagerObserver)
    func geocodeAddress(for text: String?)
    func requestUserLocation()
}

public final class LocationManager: NSObject {
    weak public var observer: LocationManagerObserver?
    
    private let geoCoder = CLGeocoder()
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        return manager
    }()
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        observer?.locationDidReceive(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
    }
}

extension LocationManager: LocationManagerProtocol {
    public func addObserver(_ observer: LocationManagerObserver) {
        self.observer = observer
    }
    
    public func requestUserLocation() {
        locationManager.startUpdatingLocation()
    }
    
    public func geocodeAddress(for text: String?) {
        guard let text = text, !text.isEmpty else { return }
        geoCoder.geocodeAddressString(text) { [weak self] (placemarks, error) in
            guard let location = placemarks?.first?.location?.coordinate else { return }
            self?.observer?.locationDidReceive(lat: location.latitude, lon: location.longitude)
        }
    }
}
