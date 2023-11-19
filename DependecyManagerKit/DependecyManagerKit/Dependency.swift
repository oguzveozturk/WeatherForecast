//
//  Dependency.swift
//  DependecyManagerKit
//
//  Created by Oğuz Öztürk on 19.11.2023.
//

import Foundation

@propertyWrapper
public final class Dependency<Value> {
    private var value: Value?
    private let engine: DependencyManager
    
    public var wrappedValue: Value {
        get {
            if let value {
                return value
            } else {
                let value: Value = engine.read(for: Value.self)
                self.value = value
                return value
            }
        }
        set {
            value = newValue
        }
    }
    
    public init(engine: DependencyManager = .shared) {
        self.engine = engine
    }
    
    public convenience init(wrappedValue: Value, engine: DependencyManager = .shared) {
        self.init(engine: engine)
        self.value = wrappedValue
    }
}
