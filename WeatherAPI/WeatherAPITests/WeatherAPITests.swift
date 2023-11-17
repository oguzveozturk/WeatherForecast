//
//  WeatherAPITests.swift
//  WeatherAPITests
//
//  Created by Oğuz Öztürk on 13.11.2023.
//

import XCTest
@testable import WeatherAPI

final class WeatherAPITests: XCTestCase {
    let serviceMock = ForecastServiceMock()
    
    func testMoviesServiceMock() async {
        let successResult = await serviceMock.search(parameter: .init(lat: 0, lon: 0))
            
        switch successResult {
        case .success(let forecast):
            XCTAssertEqual(forecast.humidity, 55)
        case .failure:
            XCTFail("The request should not fail")
        }
    }
}
