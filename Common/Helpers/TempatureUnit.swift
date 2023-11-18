//
//  TempatureUnit.swift
//  Common
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import Foundation

public enum TempatureUnit: String, Codable, CaseIterable {
    case kelvin, celsius, fahrenheit
    
    public var unit: UnitTemperature {
        switch self {
        case .kelvin:
            return .kelvin
        case .celsius:
            return .celsius
        case .fahrenheit:
            return .fahrenheit
        }
    }
    
    public var systemImageName: String {
        switch self {
        case .kelvin:
            return "k.circle"
        case .celsius:
            return "c.circle"
        case .fahrenheit:
            return "f.circle"
        }
    }
    
    private static var measurementFormatter: MeasurementFormatter {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        measurementFormatter.unitOptions = .providedUnit
        return measurementFormatter
    }
    
    public func convertTo(temp: Double) -> String {
        let measurement = Measurement(value: temp, unit: UnitTemperature.kelvin)
        let localMeasurement = measurement.converted(to: unit)
        return Self.measurementFormatter.string(from: localMeasurement)
    }
}
