//
//  JSONParser.swift
//  Common
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import Foundation

public class JSONParser {
    public static func decode<T: Decodable>(for model: T.Type, fileName: String, bundle: Bundle) -> T {
        let data = readFile(for: fileName, bundle: bundle)
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let decodedData = try decoder.decode(model, from: data)
            return decodedData
        } catch {
            fatalError()
        }
    }
    
    fileprivate static func readFile(for name: String, bundle: Bundle) -> Data {
        do {
            if let bundlePath = bundle.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error.localizedDescription)
        }
        fatalError()
    }
}
