//
//  TempResponse.swift
//  WeatherAPI
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import Foundation

struct TempResponse: Codable {
    let day: Double?
    let min: Double?
    let max: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
}

extension TempResponse {
    var asTempDTO: TempDTO {
        TempDTO(day: day ?? 0,
              min: min ?? 0,
              max: max ?? 0,
              night: night ?? 0,
              eve: eve ?? 0,
              morn: morn ?? 0)
    }
}
