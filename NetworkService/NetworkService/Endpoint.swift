//
//  Endpoint.swift
//  NetworkService
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import Common

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [String : String] { get }
}

extension Endpoint {
    public var scheme: String {
        return NetworkConfig.scheme
    }

    public var host: String {
        return NetworkConfig.host
    }
}
