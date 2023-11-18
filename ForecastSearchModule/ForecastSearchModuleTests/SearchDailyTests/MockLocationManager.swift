//
//  MockLocationManager.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
import LocationManager
@testable import ForecastSearchModule

final class MockLocationManager: LocationManagerProtocol {

    var stubbedObserver: LocationManagerObserver!

    var observer: LocationManagerObserver?

    var invokedAddObserver = false
    var invokedAddObserverCount = 0

    func addObserver(_ observer: LocationManagerObserver) {
        invokedAddObserver = true
        invokedAddObserverCount += 1
    }

    var invokedGeocodeAddress = false
    var invokedGeocodeAddressCount = 0
    var invokedGeocodeAddressParameters: (text: String?, Void)?
    var invokedGeocodeAddressParametersList = [(text: String?, Void)]()

    func geocodeAddress(for text: String?) {
        invokedGeocodeAddress = true
        invokedGeocodeAddressCount += 1
        invokedGeocodeAddressParameters = (text, ())
        invokedGeocodeAddressParametersList.append((text, ()))
    }

    var invokedRequestUserLocation = false
    var invokedRequestUserLocationCount = 0

    func requestUserLocation() {
        invokedRequestUserLocation = true
        invokedRequestUserLocationCount += 1
    }
}
