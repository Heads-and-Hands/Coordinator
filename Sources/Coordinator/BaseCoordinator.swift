//
//  File.swift
//  
//
//  Created by basalaev on 19.01.2021.
//

import Foundation

open class BaseCoordinator<Router, Resolver>: Coordinator {
    public let router: Router
    public let resolver: Resolver

    // TODO: Добавить функцию для удаления
    public private(set) var childs: [Coordinator] = []

    open func start() throws {}

    public init(router: Router, resolver: Resolver) {
        self.router = router
        self.resolver = resolver
    }

    public func startNext<T: Coordinator & FinishableCoordinator>(_ coordinator: T, finishFlow: T.FinishFlow) throws {
        coordinator.finishFlow = finishFlow
        try startNext(coordinator)
    }

    public func startNext(_ coordinator: Coordinator) throws {
        addDependency(coordinator)
        try coordinator.start()
    }

    public func addDependency(_ coordinator: Coordinator) {
        guard !childs.contains(where: { $0 === coordinator }) else {
            return
        }

        childs.append(coordinator)
    }

    public func removeDependency(_ coordinator: Coordinator?) {
        guard !childs.isEmpty, let coordinator = coordinator else {
            return
        }

        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childs.isEmpty {
            coordinator.childs
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }

        childs.removeAll(where: { $0 === coordinator })
    }
}
