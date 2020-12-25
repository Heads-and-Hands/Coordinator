import UIKit

public final class TabsRouter: BaseRouter {
    private var tabBarController: UITabBarController? {
        rootController as? UITabBarController
    }

    public init(tabBarController: UITabBarController) {
        super.init(rootController: tabBarController)
    }

    public override func set(screens: [UIViewController], animated: Bool) {
        tabBarController?.setViewControllers(screens, animated: animated)
    }

    public override func add(screens: [UIViewController], animated: Bool) {
        let viewControllers = (tabBarController?.viewControllers ?? []) + screens
        set(screens: viewControllers, animated: animated)
    }

    public override func delete(screens: [UIViewController], animated: Bool) {
        // TODO: Добавить реализацию
    }
}
