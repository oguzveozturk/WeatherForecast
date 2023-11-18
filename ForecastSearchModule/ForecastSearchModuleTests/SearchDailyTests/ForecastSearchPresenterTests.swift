//
//  ForecastSearchPresenterTests.swift
//  ForecastSearchModuleTests
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import XCTest
import WeatherAPI
import Common
import LocationManager
@testable import ForecastSearchModule

final class ForecastSearchPresenterTests: XCTestCase {
    private var presenter: ForecastSearchPresenter!
    private var view: MockForecastSearchController!
    private var interactor: MockForecastSearchInteractor!
    private var router: MockForecastSearchRouter!
    private var locationManager: MockLocationManager!

    private var error: NSError {
        NSError(domain: "", code: 404, userInfo: [ NSLocalizedDescriptionKey: "Network Error"])
    }
    
    override func setUp() {
        super.setUp()
        view = MockForecastSearchController()
        interactor = MockForecastSearchInteractor()
        router = MockForecastSearchRouter()
        locationManager = MockLocationManager()
        presenter = .init(view: view, interactor: interactor, router: router, locationManager: locationManager)
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
        interactor = nil
        router = nil
        locationManager = nil
    }
    
    func test_load() {
        XCTAssertFalse(locationManager.invokedAddObserver)
        XCTAssertEqual(locationManager.invokedAddObserverCount, 0)
        
        presenter.load()
        
        XCTAssertTrue(locationManager.invokedAddObserver)
        XCTAssertEqual(locationManager.invokedAddObserverCount, 1)
    }
    
    func test_updateUnit() {
        XCTAssertFalse(view.invokedSetBarMenuTitle)
        XCTAssertEqual(view.invokedSetBarMenuTitleCount, 0)
        XCTAssertNil(view.invokedSetBarMenuTitleParameters)
        XCTAssertTrue(view.invokedSetBarMenuTitleParametersList.isEmpty)
        
        XCTAssertFalse(view.invokedReloadData)
        XCTAssertEqual(view.invokedReloadDataCount, 0)
        
        view.setBarMenuTitle(TempatureUnit.kelvin.rawValue)
        view.reloadData()
        
        XCTAssertTrue(view.invokedSetBarMenuTitle)
        XCTAssertEqual(view.invokedSetBarMenuTitleCount, 1)
        XCTAssertEqual(view.invokedSetBarMenuTitleParameters?.text, "kelvin")
        XCTAssertEqual(view.invokedSetBarMenuTitleParametersList.map(\.text), ["kelvin"])
        
        XCTAssertTrue(view.invokedReloadData)
        XCTAssertEqual(view.invokedReloadDataCount, 1)
    }
    
    func test_search() {
        XCTAssertFalse(interactor.invokedSearch)
        XCTAssertEqual(interactor.invokedSearchCount, 0)
        XCTAssertNil(interactor.invokedSearchParameters)
        XCTAssertTrue(interactor.invokedSearchParametersList.isEmpty)
        
        interactor.search(lat: 40.9223, lon: 29.1563)
        
        XCTAssertTrue(interactor.invokedSearch)
        XCTAssertEqual(interactor.invokedSearchCount, 1)
        XCTAssertEqual(interactor.invokedSearchParameters?.lat, 40.9223)
        XCTAssertEqual(interactor.invokedSearchParameters?.lon, 29.1563)
        XCTAssertEqual(interactor.invokedSearchParametersList.map(\.lat), [40.9223])
        XCTAssertEqual(interactor.invokedSearchParametersList.map(\.lon), [29.1563])
    }
    
    func test_geocodeAddress() {
        XCTAssertFalse(view.invokedShowIndicator)
        XCTAssertEqual(view.invokedShowIndicatorCount, 0)
        
        XCTAssertFalse(locationManager.invokedGeocodeAddress)
        XCTAssertEqual(locationManager.invokedGeocodeAddressCount, 0)
        XCTAssertNil(locationManager.invokedGeocodeAddressParameters)
        XCTAssertTrue(locationManager.invokedGeocodeAddressParametersList.isEmpty)
        
        view.showIndicator()
        locationManager.geocodeAddress(for: "Ankara")
        
        XCTAssertTrue(view.invokedShowIndicator)
        XCTAssertEqual(view.invokedShowIndicatorCount, 1)
        
        XCTAssertTrue(locationManager.invokedGeocodeAddress)
        XCTAssertEqual(locationManager.invokedGeocodeAddressCount, 1)
        XCTAssertEqual(locationManager.invokedGeocodeAddressParameters?.text, "Ankara")
        XCTAssertEqual(locationManager.invokedGeocodeAddressParametersList.map(\.text), ["Ankara"])
    }
    
    func test_didSelect() {
        XCTAssertFalse(router.invokedPresent)
        XCTAssertEqual(router.invokedPresentCount, 0)
        
        let route = ForecastSearchRoute.hourlyDetail(.init(hourlyDTO: forecastDTO.hourly,
                                        selectedDay: forecastDTO.daily[0].dt))
        router.present(route: route)
        
        XCTAssertTrue(router.invokedPresent)
        XCTAssertEqual(router.invokedPresentCount, 1)
    }
    
    func test_handleSuccess() {
        XCTAssertFalse(view.invokedHideIndicator)
        XCTAssertEqual(view.invokedHideIndicatorCount, 0)
        XCTAssertEqual(presenter.forecastDTO.daily.count, 0)
        XCTAssertEqual(presenter.forecastDTO.hourly.count, 0)
        XCTAssertFalse(view.invokedReloadData)
        XCTAssertEqual(view.invokedReloadDataCount, 0)
        
        presenter.handle(.showForecast(forecastDTO))
        
        XCTAssertTrue(view.invokedHideIndicator)
        XCTAssertEqual(view.invokedHideIndicatorCount, 1)
        XCTAssertEqual(presenter.forecastDTO.daily.count, 8)
        XCTAssertEqual(presenter.forecastDTO.hourly.count, 48)
        XCTAssertTrue(view.invokedReloadData)
        XCTAssertEqual(view.invokedReloadDataCount, 1)
    }
    
    func test_handleError() {
        XCTAssertFalse(view.invokedHideIndicator)
        XCTAssertEqual(view.invokedHideIndicatorCount, 0)
        
        XCTAssertFalse(view.invokedShowAlert)
        XCTAssertEqual(view.invokedShowAlertCount, 0)
        XCTAssertNil(view.invokedShowAlertParameters)
        XCTAssertTrue(view.invokedShowAlertParametersList.isEmpty)
        
        presenter.handle(.showError(error))
        
        XCTAssertTrue(view.invokedHideIndicator)
        XCTAssertEqual(view.invokedHideIndicatorCount, 1)
        
        XCTAssertTrue(view.invokedShowAlert)
        XCTAssertEqual(view.invokedShowAlertCount, 1)
        XCTAssertEqual(view.invokedShowAlertParameters?.message, "Network Error")
        XCTAssertEqual(view.invokedShowAlertParametersList.map(\.message), ["Network Error"])
    }
}

extension ForecastSearchPresenterTests {
    var bundle: Bundle { .init(for: Self.self) }
    
    var forecastDTO: ForecastDTO {
        JSONParser.decode(for: ForecastResponse.self,
                          fileName: "ForecastSearchResponse",
                          bundle: bundle).asForecastDTO
    }
}

