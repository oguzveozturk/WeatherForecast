//
//  Configuration.swift
//  Common
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

protocol ConfigurationProtocol {
    static var openWeatherHost: String { get }
    static var appid: String { get }
    static var scheme: String { get }
}

public final class Configuration {
    static var dictionary: NSMutableDictionary = {
        let filePath =  Bundle.main.path(forResource: "Config", ofType: "plist")!
        return NSMutableDictionary(contentsOfFile: filePath)!
    }()

    static func getValue(for key: String) -> String? {
        return dictionary[key] as? String
    }
}

extension Configuration: ConfigurationProtocol {
    public static var openWeatherHost: String { getValue(for: "openWeatherHost")! }
    public static var appid: String { getValue(for: "appid")! }
    public static var scheme: String { getValue(for: "scheme")! }
}
