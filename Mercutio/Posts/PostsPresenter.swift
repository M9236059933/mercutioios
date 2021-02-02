//
//  PostsPresenter.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

class PostsPresenter: IPresenter {
    weak var state: PostsState?
    func response(_ posts: [Post]) {
        state?.updateAndDisplay(posts)
    }
    func showError(_ error: Error) {
        ModalState.shared.modalVM = errorModalVM
        ModalState.shared.show()
    }
}
