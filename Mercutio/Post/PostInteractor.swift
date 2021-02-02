//
//  PostInteractor.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

class PostInteractor: IInteractor {
    var presenter: PostPresenter?
    var worker: PostWorker?

    func request() {
        worker = PostWorker()
        worker?.work()
        presenter?.response()
    }
}
