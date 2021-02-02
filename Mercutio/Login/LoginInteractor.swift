//
//  LoginInteractor.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

class LoginInteractor: IInteractor {
    var presenter: LoginPresenter?
    var worker: LoginWorker?

    func request() {
        worker = LoginWorker()
        worker?.work()
        presenter?.response()
    }
}
