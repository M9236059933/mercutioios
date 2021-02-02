//
//  PostState.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//
import Combine

class PostState: ObservableObject, IState {
    var interactor: PostInteractor?
    let stashButton: String = "STASH FOR LATER"
    let slash: String = "/"
    // swiftlint:disable identifier_name
    let or: String = "or"
    // swiftlint:enable identifier_name
    @Published var post: Post
    @Published var categoryMain: String = ""
    @Published var categorySub: String = ""
    @Published var showingImageViewer: Bool = false
    func showImageViewer() {
        showingImageViewer = true
    }
    func back() {
        Navigator.shared.back()
    }
    func share() {
        // MARK: /// some action
    }
    func stash() {
        // MARK: /// some action
    }
    func buy() {
        // MARK: /// some action
    }
    func main() {
        // MARK: /// some action
    }
    func sub() {
        // MARK: /// some action
    }
    func update() {
        categoryMain = "#\(post.category.parent?.title ?? "")".uppercased()
        categorySub = "#\(post.category.title)".uppercased()
        post.title = post.title.uppercased()
    }
    init(_ post: Post) {
        self.post = post
        setup()
        update()
    }
}

extension PostState {
    private func setup() {
        let state = self
        let interactor = PostInteractor()
        let presenter = PostPresenter()
        state.interactor = interactor
        interactor.presenter = presenter
        presenter.state = state
    }
}
