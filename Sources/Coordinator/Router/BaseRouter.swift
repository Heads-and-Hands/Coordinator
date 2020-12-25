import UIKit

open class BaseRouter: Router {
    public weak var rootController: UIViewController?

    public init(rootController: UIViewController) {
        self.rootController = rootController
    }

    open func set(screens: [UIViewController], animated: Bool) {}
    open func add(screens: [UIViewController], animated: Bool) {}
    open func delete(screens: [UIViewController], animated: Bool) {}
    open func select(screen: UIViewController, animated: Bool) {}
}
