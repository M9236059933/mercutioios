//
//  PostsInteractor.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Combine
import SwiftUI

class PostsInteractor: IInteractor {
    var presenter: PostsPresenter?
    var worker: PostsWorker?
    private var cancellable: AnyCancellable?
    func request() {
        worker = PostsWorker()
        cancellable = worker?.fetch()
            .mapError({ (error) -> Error in
                self.presenter?.showError(error)
                logs(error)
                return error
            })
            .sink(receiveCompletion: { _ in
                LoadingState.shared.hide()
            }, receiveValue: { postAPI in
                self.presenter?.response(postAPI.results)
            })
    }
}
