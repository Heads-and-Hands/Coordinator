import Foundation

open class BaseCoordinator: Coordinator {
    public let router: Router
    public let resolver: Resolver

    private var childs: [Coordinator] = []

    open func start() {}

    public init(router: Router, resolver: Resolver) {
        self.router = router
        self.resolver = resolver
    }

    public func start<T: Coordinator & FinishableCoordinator>(_ coordinator: T, finishFlow: T.FinishFlow) {
        coordinator.finishFlow = finishFlow
        start(coordinator)
    }

    public func start(_ coordinator: Coordinator) {
        addDependency(coordinator)
        coordinator.start()
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
