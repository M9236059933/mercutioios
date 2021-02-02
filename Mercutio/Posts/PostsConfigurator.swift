//
//  PostsConfigurator.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

extension PostsView: IView {
    static var configurator: IConfigurator = PostsConfigurator.shared
}

final class PostsConfigurator: IConfigurator {
    private init() {}
    static let shared = PostsConfigurator()
    func createView(_ data: Any?) -> UIViewController {
        let view = PostsView()
        let container = SplashView(content: ContainerView(content: view))
        return UIHostingController(rootView: container)
    }
}
