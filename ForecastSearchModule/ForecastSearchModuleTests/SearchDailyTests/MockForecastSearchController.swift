//
//  MockForecastSearchController.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
import struct WeatherAPI.ForecastDTO
@testable import ForecastSearchModule

final class MockForecastSearchController: ForecastSearchControllerProtocol {
    var invokedSetBarMenuTitle = false
    var invokedSetBarMenuTitleCount = 0
    var invokedSetBarMenuTitleParameters: (text: String, Void)?
    var invokedSetBarMenuTitleParametersList = [(text: String, Void)]()

    func setBarMenuTitle(_ text: String) {
        invokedSetBarMenuTitle = true
        invokedSetBarMenuTitleCount += 1
        invokedSetBarMenuTitleParameters = (text, ())
        invokedSetBarMenuTitleParametersList.append((text, ()))
    }

    var invokedShowIndicator = false
    var invokedShowIndicatorCount = 0

    func showIndicator() {
        invokedShowIndicator = true
        invokedShowIndicatorCount += 1
    }

    var invokedHideIndicator = false
    var invokedHideIndicatorCount = 0

    func hideIndicator() {
        invokedHideIndicator = true
        invokedHideIndicatorCount += 1
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedShowAlert = false
    var invokedShowAlertCount = 0
    var invokedShowAlertParameters: (message: String, Void)?
    var invokedShowAlertParametersList = [(message: String, Void)]()

    func showAlert(message: String) {
        invokedShowAlert = true
        invokedShowAlertCount += 1
        invokedShowAlertParameters = (message, ())
        invokedShowAlertParametersList.append((message, ()))
    }
}
