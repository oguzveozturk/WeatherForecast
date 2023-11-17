//
//  FeelsLikeResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

struct FeelsLikeResponse: Codable {
    let day: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
}

extension FeelsLikeResponse {
    var asFeelsLikeDTO: FeelsLikeDTO {
        FeelsLikeDTO(day: day ?? 0,
              night: night ?? 0,
              eve: eve ?? 0,
              morn: morn ?? 0)
    }
}
