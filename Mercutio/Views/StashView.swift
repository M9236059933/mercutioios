//
//  StashView.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct StashView: View {
    var body: some View {
        VStack {
            Text("Stash")
        }
        .onOpenURL { url in
            FAuthManager.shared.openSignInLink(url, "")
        }
    }
}

extension StashView: IView {
    static var configurator: IConfigurator = StashConfigurator.shared
}

final class StashConfigurator: IConfigurator {
    private init() {}
    static let shared = StashConfigurator()
    func createView(_ data: Any?) -> UIViewController {
        let view = StashView()
        let container = SplashView(content: ContainerView(content: view))
        return UIHostingController(rootView: container)
    }
}
