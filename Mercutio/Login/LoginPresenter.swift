//
//  LoginPresenter.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

class LoginPresenter: IPresenter {
    weak var state: LoginState?
    func response() {
        state?.updateAndDisplay()
    }
    func showError(_ error: Error) {}
}
