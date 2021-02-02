//
//  SceneDelegate.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        initScene(scene)
//        setupGoogle()
//        setupApple()
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
        SplashState.shared.hide()
    }
    func sceneWillResignActive(_ scene: UIScene) {
        SplashState.shared.show()
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
