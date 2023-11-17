//
//  Array+Ext.swift
//  Common
//
//  Created by Oğuz Öztürk on 13.11.2023.
//

import Foundation

public extension Collection {
    subscript(safe index: Index?) -> Element? {
        if let index = index,
           indices.contains(index) {
            return self[index]
        }
        return nil
    }
}

public extension MutableCollection {
    subscript(safe index: Index?) -> Element? {
        get {
            if let index = index,
               indices.contains(index) {
                return self[index]
            }
            return nil
        }

        set(newValue) {
            if let newValue = newValue,let index = index, indices.contains(index) {
                self[index] = newValue
            }
        }
    }
}
