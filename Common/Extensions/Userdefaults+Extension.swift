//
//  Userdefaults+Extension.swift
//  Common
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import Foundation

@propertyWrapper
public struct Defaults<Value:Codable> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    
    public init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }

   public var wrappedValue: Value {
        get {
            guard let data = container.object(forKey: key) as? Data else {
                    return defaultValue
                }
            
            let value = try? JSONDecoder().decode(Value.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            
            container.set(data, forKey: key)
        }
    }
}

public extension UserDefaults {
    @Defaults(key: "tempatureUnit", defaultValue: TempatureUnit.celsius)
    static var tempatureUnit: TempatureUnit
}
