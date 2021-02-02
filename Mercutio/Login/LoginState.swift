//
//  LoginState.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//
import Combine
import Foundation

class LoginState: ObservableObject, IState {
    var interactor: LoginInteractor?
    let emailPlaceholder: String = "Email"
    let passwordPlaceholder: String = "Password"
    let loginButton: String = "Login"
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var disabled: Bool = false
    func login() {
        interactor?.request()
    }
    func updateAndDisplay() {}
    init() {
        setup()
    }
}

extension LoginState {
    private func setup() {
        let state = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        state.interactor = interactor
        interactor.presenter = presenter
        presenter.state = state
    }
}
