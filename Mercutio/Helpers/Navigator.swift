//
//  Navigator.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

extension SceneDelegate {
    private static var _window: UIWindow?
    func initScene(_ scene: UIScene) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.makeKeyAndVisible()
            SceneDelegate._window = self.window
            Navigator.shared.root(view: PostsView.self, nil)
        }
    }
    static func root(_ navigationController: UIViewController) {
        _window?.rootViewController = navigationController
    }
}

class Navigator {
    private init() {}
    static let shared = Navigator()
    internal weak var navigationController: UINavigationController? {
        if let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let firstWindow = firstScene.windows.first {
            let rootViewController = firstWindow.rootViewController
            if rootViewController is UINavigationController {
                return rootViewController as? UINavigationController
            } else {
                return rootViewController?.navigationController
            }
        }
        return nil
    }
    func push<Content: IView>(view: Content.Type, _ data: Any? = nil) {
        let configurator = ModuleConfig.shared.configFor(view: view)
        let hostingController = configurator.createView(data)
        navigationController?.pushViewController(hostingController, animated: true)
    }
    func present<Content: IView>(view: Content.Type, _ data: Any? = nil) {
        let configurator = ModuleConfig.shared.configFor(view: view)
        let hostingController = configurator.createView(data)
        navigationController?.present(hostingController, animated: true, completion: nil)
    }
    func root<Content: IView>(view: Content.Type, _ data: Any? = nil) {
        let configurator = ModuleConfig.shared.configFor(view: view)
        let hostingController = configurator.createView(data)
        let navigationController = UINavigationController(rootViewController: hostingController)
        navigationController.navigationBar.isHidden = true
        SceneDelegate.root(navigationController)
    }
    func back() {
        // MARK: /// or dismiss
        navigationController?.popViewController(animated: true)
    }
    func dismiss() {
        navigationController?.dismiss(animated: true)
    }
}
