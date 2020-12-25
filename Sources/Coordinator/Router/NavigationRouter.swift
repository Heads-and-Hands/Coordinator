import UIKit

public final class NavigationRouter: BaseRouter {
    private var navigationController: UINavigationController? {
        rootController as? UINavigationController
    }

    public init(navigationController: UINavigationController) {
        super.init(rootController: navigationController)
    }

    public override func set(screens: [UIViewController], animated: Bool) {
        navigationController?.setViewControllers(screens, animated: animated)
    }

    public override func add(screens: [UIViewController], animated: Bool) {
        if screens.count == 1, let screen = screens.first {
            navigationController?.pushViewController(screen, animated: animated)
        } else {
            let viewControllers = (navigationController?.viewControllers ?? []) + screens
            set(screens: viewControllers, animated: animated)
        }
    }

    public override func delete(screens: [UIViewController], animated: Bool) {
        let screensSet = Set(screens)
        let currentViewControllers = navigationController?.viewControllers ?? []
        let newViewControllers = currentViewControllers.filter { !screensSet.contains($0) }
        navigationController?.setViewControllers(newViewControllers, animated: animated)
    }

    public override func select(screen: UIViewController, animated: Bool) {
        navigationController?.popToViewController(screen, animated: animated)
    }
}
