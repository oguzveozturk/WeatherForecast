//
//  DependencyManager.swift
//  DependecyManagerKit
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

public final class DependencyManager {
    var dependencies: [ObjectIdentifier: () -> Any] = [:]
    public static let shared = DependencyManager()
    
    private init() {}
    
    public func register(value: @autoclosure @escaping () -> Any, for interface: Any.Type) {
        dependencies[ObjectIdentifier(interface)] = value
    }
    
    public func read<Value>(for interface: Any.Type) -> Value {
        guard let value = dependencies[ObjectIdentifier(interface)]?() as? Value else {
            fatalError("\(interface) not found")
        }
        return value
    }
}
