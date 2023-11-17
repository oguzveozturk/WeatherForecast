//
//  ForecastEndpoint.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import NetworkService

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
            return ["appid":"7b71ab4a3a64840af89d1143b16dcda4",
                    "lat":String(parameter.lat),
                    "lon":String(parameter.lon),
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
