//
//  MockForecastSearchRouter.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
@testable import ForecastSearchModule

final class MockForecastSearchRouter: ForecastSearchRouterProtocol {

    var invokedPresent = false
    var invokedPresentCount = 0

    func present(route: ForecastSearchRoute) {
        invokedPresent = true
        invokedPresentCount += 1
    }
}
