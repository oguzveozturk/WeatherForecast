//
//  ForecastService.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import NetworkService
import Common
import Cache

public protocol ForecastServiceable {
    func search(parameter: ForecastParameter) async -> Result<ForecastDTO, RequestError>
}

public struct ForecastService: NetworkService {
    private let cache: Cache<ForecastParameter, ForecastResponse> = .fromDisk(file: String(describing: Self.self)) ?? .init()
    public init() { }
}

extension ForecastService: ForecastServiceable {
    public func search(parameter: ForecastParameter) async -> Result<ForecastDTO, RequestError> {
        if let cached = cache[parameter] {
            return .success(cached.asForecastDTO)
        }
        let result = await sendRequest(endpoint: ForecastEndpoint.search(parameter),
                                       responseModel: ForecastResponse.self)
        switch result {
        case .success(let response):
            cache[parameter] = response
            try? cache.saveToDisk(withName: String(describing: Self.self))
            return .success(response.asForecastDTO)
        case .failure(let err):
            return .failure(err)
        }
    }
}
