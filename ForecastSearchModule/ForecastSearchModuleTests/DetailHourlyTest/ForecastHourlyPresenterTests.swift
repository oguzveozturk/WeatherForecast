//
//  ForecastHourlyPresenterTests.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
import WeatherAPI
import Common
@testable import ForecastSearchModule

final class ForecastHourlyPresenterTests: XCTestCase {
    private var presenter: ForecastHourlyPresenter!
    private var view: MockForecastHourlyController!
    var hourlyDTO: [HourlyDTO] = []
    var selectedDay: Date = .init()
    
    override func setUp() {
        super.setUp()
        view = MockForecastHourlyController()
        let forecastDTO = forecastDTO
        presenter = .init(view: view, hourlyDTO: forecastDTO.hourly, selectedDay: forecastDTO.daily[0].dt)
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
    }
    
    func test_load() {
        XCTAssertFalse(view.invokedSetTitle)
        XCTAssertEqual(view.invokedSetTitleCount, 0)
        XCTAssertNil(view.invokedSetTitleParameters)
        XCTAssertTrue(view.invokedSetTitleParametersList.isEmpty)
        
        presenter.load()
        
        XCTAssertTrue(view.invokedSetTitle)
        XCTAssertEqual(view.invokedSetTitleCount, 1)
        XCTAssertEqual(view.invokedSetTitleParameters?.text, selectedDay.formatted(date: .complete, time: .omitted))
        XCTAssertEqual(view.invokedSetTitleParametersList.map(\.text), [selectedDay.formatted(date: .complete, time: .omitted)])
    }
    
    func test_filterForSelectedDay() {
        XCTAssertEqual(presenter.hourlyDTO.count, 48)
        presenter.filterForSelectedDay()
        XCTAssertEqual(presenter.hourlyDTO.count, 6)
    }
    
    func test_setEmptyMessageIfNeeded() {
        XCTAssertFalse(view.invokedSetEmptyMessage)
        XCTAssertEqual(view.invokedSetEmptyMessageCount, 0)
        XCTAssertNil(view.invokedSetEmptyMessageParameters)
        XCTAssertTrue(view.invokedSetEmptyMessageParametersList.isEmpty)
        
        presenter.selectedDay = forecastDTO.daily[4].dt
        presenter.filterForSelectedDay()
        presenter.setEmptyMessageIfNeeded()
        
        XCTAssertTrue(view.invokedSetEmptyMessage)
        XCTAssertEqual(view.invokedSetEmptyMessageCount, 1)
        XCTAssertEqual(view.invokedSetEmptyMessageParameters?.text, "Hourly detail is only available for 48 hours")
        XCTAssertEqual(view.invokedSetEmptyMessageParametersList.map(\.text), ["Hourly detail is only available for 48 hours"])
    }
}

extension ForecastHourlyPresenterTests {
    var bundle: Bundle { .init(for: Self.self) }
    
    var forecastDTO: ForecastDTO {
        JSONParser.decode(for: ForecastResponse.self,
                          fileName: "ForecastSearchResponse",
                          bundle: bundle).asForecastDTO
    }
}
