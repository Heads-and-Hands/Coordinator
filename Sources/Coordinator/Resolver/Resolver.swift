//
//  File.swift
//  
//
//  Created by basalaev on 25.09.2020.
//

import Foundation

public protocol Resolver {
    func make<T>() -> T?
    func make<T, A>(arguments arg1: A) -> T?
}
