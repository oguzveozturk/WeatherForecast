//
//  MockForecastSearchInteractor.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
@testable import ForecastSearchModule

final class MockForecastSearchInteractor: ForecastSearchInteractorProtocol {
    var output: ForecastSearchInteractorDelegate?

    var invokedSearch = false
    var invokedSearchCount = 0
    var invokedSearchParameters: (lat: Double, lon: Double)?
    var invokedSearchParametersList = [(lat: Double, lon: Double)]()

    func search(lat: Double, lon: Double) {
        invokedSearch = true
        invokedSearchCount += 1
        invokedSearchParameters = (lat, lon)
        invokedSearchParametersList.append((lat, lon))
    }
}
