//
//  FacebookConfig.swift
//  MFramework
//
//  Created by Mac on 29.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

extension AppDelegate {
    // swiftlint:disable line_length
    func application( _ app: UIApplication, open url: URL,
                      options: [UIApplication.OpenURLOptionsKey: Any] = [:] ) -> Bool {
        ApplicationDelegate.shared.application(app, open: url,
                                               sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                               annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
    // swiftlint:enable line_length
    func initFacebook(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension SceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let context = URLContexts.first else {
            fatalError("Open url called without a context. This should never happen.")
        }
        ApplicationDelegate.shared.application(UIApplication.shared, open: context.url,
                                               sourceApplication: nil, annotation: nil)
    }
}
