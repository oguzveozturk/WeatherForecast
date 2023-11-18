//
//  MockForecastHourlyController.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
import struct WeatherAPI.HourlyDTO
@testable import ForecastSearchModule

final class MockForecastHourlyController: ForecastHourlyControllerProtocol {
    var invokedSetTitle = false
    var invokedSetTitleCount = 0
    var invokedSetTitleParameters: (text: String, Void)?
    var invokedSetTitleParametersList = [(text: String, Void)]()

    func setTitle(text: String) {
        invokedSetTitle = true
        invokedSetTitleCount += 1
        invokedSetTitleParameters = (text, ())
        invokedSetTitleParametersList.append((text, ()))
    }

    var invokedSetEmptyMessage = false
    var invokedSetEmptyMessageCount = 0
    var invokedSetEmptyMessageParameters: (text: String, Void)?
    var invokedSetEmptyMessageParametersList = [(text: String, Void)]()

    func setEmptyMessage(text: String) {
        invokedSetEmptyMessage = true
        invokedSetEmptyMessageCount += 1
        invokedSetEmptyMessageParameters = (text, ())
        invokedSetEmptyMessageParametersList.append((text, ()))
    }
}
