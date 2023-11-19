//
//  ForecastEndpoint.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import NetworkService
import Common

enum ForecastEndpoint {
    case search(ForecastParameter)
}

extension ForecastEndpoint: Endpoint {
    var path: String {
        switch self {
        case .search:
            return "/data/2.5/onecall"
        }
    }
    
    var queryItems: [String : String] {
        switch self {
        case .search(let parameter):
            return ["appid": WeatherAPIConfig.apiKey,
                    "lat": String(parameter.lat),
                    "lon": String(parameter.lon),
                    "exclude": parameter.excludes.joined(separator: ",")]
        }
    }

    var method: RequestMethod {
        switch self {
        case .search:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .search:
            return [:]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .search:
            return nil
        }
    }
}
