//
//  PostPresenter.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

class PostPresenter: IPresenter {
    weak var state: PostState?

    func response() {}
    func showError(_ error: Error) {}
}
