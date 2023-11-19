//
//  AppLogger.swift
//  AppLogger
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import OSLog

public struct AppLogger {
    
    public static func log(tag: LogTag = .debug, _ items: Any...,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line ,
                    separator: String = " ") {
        
        let shortFileName = URL(string: file)?.lastPathComponent ?? "---"
        
        let output = items.map {
            if let itm = $0 as? HTTPURLResponse {
                let statusCode = "Status Code: \(itm.statusCode)\n"
                let headers = itm.allHeaderFields.map { "\($0.key): \($0.value)" }.joined(separator: "\n")
                return statusCode + headers
            } else if let itm = $0 as? CustomStringConvertible {
                return "\(itm.description)"
            } else {
                return "\($0)"
            }
        }
            .joined(separator: separator)
        
        var msg = "\(tag.label) "
        let category = "\(shortFileName) - \(function) - line \(line)"
        if !output.isEmpty { msg += "\n\(output)" }
        
        let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "--", category: category)
        
        switch tag {
        case .error:    logger.error("\(msg)")
        case .warning: logger.warning("\(msg)")
        case .debug:    logger.debug("\(msg)")
        default: logger.info("\(msg)")
        }
    }
}
