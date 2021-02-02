//
//  PostsState.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//
import Combine

class PostsState: ObservableObject, IState {
    var interactor: PostsInteractor?
    @Published var posts: [Post] = []
    func push(_ post: Post) {
        Navigator.shared.push(view: PostView.self, post)
    }
    func updateAndDisplay(_ posts: [Post]) {
        self.posts = posts
    }
    func stash() {
        Navigator.shared.push(view: StashView.self)
    }
    func search() {
        // MARK: /// some action
    }
    init() {
        setup()
    }
}

extension PostsState {
    private func setup() {
        let state = self
        let interactor = PostsInteractor()
        let presenter = PostsPresenter()
        state.interactor = interactor
        interactor.presenter = presenter
        presenter.state = state
    }
}
