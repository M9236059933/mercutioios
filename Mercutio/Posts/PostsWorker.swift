//
//  PostsWorker.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Alamofire
import Combine

class PostsWorker: IWorker {
    func fetch() -> AnyPublisher<PostAPI, AFError> {
        LoadingState.shared.show()
        let publisher = AF.request(postUrl).publishDecodable(type: PostAPI.self)
        return publisher.value()
    }
}
