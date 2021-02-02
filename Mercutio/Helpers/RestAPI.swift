//
//  RestAPI.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Alamofire

public struct RestAPI {
    typealias OnError = (_ error: Error) -> Void
    typealias OnSuccess = (_ result: Any) -> Void
    let timeout: Int = 30
    public static let shared = RestAPI()
    private init() { }
    private func headers(_ token: String?) -> HTTPHeaders? {
        if let token = token {
            return ["Authorization": "Bearer " + token]
        } else {
            return nil
        }
    }
    func request(_ url: String, _ parameters: Parameters?, _ method: HTTPMethod = .get,
                 _ loading: Bool = true, _ onSuccess: @escaping OnSuccess, _ onError: @escaping OnError) {
        if loading {
            LoadingState.shared.show()
        }
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default,
                   headers: headers(nil), requestModifier: { $0.timeoutInterval = TimeInterval(self.timeout)})
            .validate()
            .responseJSON { response in
                if loading {
                    LoadingState.shared.hide()
                }
                logs(response)
                switch response.result {
                case .success(let value):
                    logs(value)
                    onSuccess(value)
                case .failure(let error):
                    logs(error.localizedDescription)
                    onError(error)
                }
        }
    }
}
