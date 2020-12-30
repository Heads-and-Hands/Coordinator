//
//  File.swift
//  
//
//  Created by basalaev on 25.09.2020.
//

import Foundation

public protocol Resolver {
    func make<T>(tag: String?) -> T?
    func make<T, A>(tag: String?, arguments arg1: A) -> T?
    func make<T, A, B>(tag: String?, arguments arg1: A, _ arg2: B) -> T?
    func make<T, A, B, C>(tag: String?, arguments arg1: A, _ arg2: B, _ arg3: C) -> T?
    func make<T, A, B, C, D>(tag: String?, arguments arg1: A, _ arg2: B, _ arg3: C,  _ arg4: D) -> T?
}

public extension Resolver {
    func make<T>() -> T? {
        make(tag: nil)
    }

    func make<T, A>(arguments arg1: A) -> T? {
        make(tag: nil, arguments: arg1)
    }

    func make<T, A, B>(arguments arg1: A, _ arg2: B) -> T? {
        make(tag: nil, arguments: arg1, arg2)
    }

    func make<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T? {
        make(tag: nil, arguments: arg1, arg2, arg3)
    }

    func make<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C,  _ arg4: D) -> T? {
        make(tag: nil, arguments: arg1, arg2, arg3, arg4)
    }
}
