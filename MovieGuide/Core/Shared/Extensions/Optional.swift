//
//  OptionalExtension.swift
//  House
//
//  Created by Ahmed samir ali on 3/25/19.
//  Copyright © 2019 Ahmed samir ali. All rights reserved.
//

import Foundation

extension Swift.Optional where Wrapped == String {

    func asStringOrEmpty() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
}

extension Swift.Optional where Wrapped == Int {
    
    func asIntOrEmpty() -> Int {
        switch self {
        case .some(let value):
            return Int(value)
        case _:
            return 0
        }
    }

}

extension Swift.Optional where Wrapped == Float {
    
    func asFloatOrEmpty() -> Float {
        switch self {
        case .some(let value):
            return Float(value)
        case _:
            return 0.0
        }
    }

}

extension Swift.Optional where Wrapped == Double {
    
    func asDoubleOrEmpty() -> Double {
        switch self {
        case .some(let value):
            return Double(value)
        case _:
            return 0.0
        }
    }

}



extension Swift.Optional where Wrapped == Bool {
    
    func asBoolOrFalse() -> Bool {
        switch self {
        case .some(let value):
            return Bool(value)
        case _:
            return false
        }
    }

}






 
