//
//  Configurator.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

protocol IConfigurator {
    func createView(_ data: Any?) -> UIViewController
}

protocol IView {
    static var configurator: IConfigurator { get }
}

protocol IState {
}

protocol IInteractor {
}

protocol IPresenter {
    func showError(_ error: Error)
}

protocol IWorker {
}

class ModuleConfig {
    private init() {}
    static let shared = ModuleConfig()
    func configFor<Content: IView>(view: Content.Type) -> IConfigurator {
        return view.configurator
    }
}
