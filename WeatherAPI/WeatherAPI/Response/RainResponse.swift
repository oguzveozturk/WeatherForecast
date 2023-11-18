//
//  RainResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

public struct RainResponse: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

extension RainResponse {
    var asRainDTO: RainDTO {
        RainDTO(the1H: the1H ?? 0)
    }
}
