//
//  PostConfigurator.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

extension PostView: IView {
    static var configurator: IConfigurator = PostConfigurator.shared
}

final class PostConfigurator: IConfigurator {
    private init() {}
    static let shared = PostConfigurator()
    func createView(_ data: Any?) -> UIViewController {
        if let post = data as? Post {
            let view = PostView(post)
            let container = SplashView(content: ContainerView(content: view))
            return UIHostingController(rootView: container)
        } else {
            return UIHostingController(rootView: EmptyView())
        }
    }
}
