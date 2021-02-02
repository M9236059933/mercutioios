//
//  LoginConfigurator.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

extension LoginView: IView {
    static var configurator: IConfigurator = LoginConfigurator.shared
}

final class LoginConfigurator: IConfigurator {
    private init() {}
    static let shared = LoginConfigurator()
    func createView(_ data: Any?) -> UIViewController {
        let view = LoginView()
        let container = SplashView(content: ContainerView(content: view))
        return UIHostingController(rootView: container)
    }
}
