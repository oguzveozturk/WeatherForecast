//
//  LocationManager.swift
//  LocationManager
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import CoreLocation

public protocol LocationManagerObserver: AnyObject {
    func locationDidReceive(lat: Double, lon: Double)
    func locationDidReceive(error: Error)
}

public protocol LocationManagerProtocol {
    var observer: LocationManagerObserver? { get set }
    
    func addObserver(_ observer: LocationManagerObserver)
    func geocodeAddress(for text: String?)
    func requestUserLocation()
}

public final class LocationManager: NSObject {
    weak public var observer: LocationManagerObserver?
    
    private var geoCoder: CLGeocoder
    private var locationManager: CLLocationManager
    
    public init(geoCoder: CLGeocoder = .init(),
                locationManager: CLLocationManager = .init()) {
        self.geoCoder = geoCoder
        self.locationManager = locationManager
        super.init()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
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
            if let error = error {
                self?.observer?.locationDidReceive(error: error)
            } else if let location = placemarks?.first?.location?.coordinate {
                self?.observer?.locationDidReceive(lat: location.latitude, lon: location.longitude)
            } else {
                self?.observer?.locationDidReceive(error: NSError(domain: "Location Manager", code: 404, userInfo: [ NSLocalizedDescriptionKey: "Location not found"]))
            }
        }
    }
}
