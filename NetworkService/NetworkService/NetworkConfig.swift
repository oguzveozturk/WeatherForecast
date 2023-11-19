//
//  NetworkConfig.swift
//  NetworkService
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

public class NetworkConfig {
    static var host = ""
    static var scheme: String = ""
    
    public static func set(scheme: String, host: String) {
        Self.scheme = scheme
        Self.host = host
    }
}
