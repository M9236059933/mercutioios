//
//  FBAuthManager.swift
//  Mercutio
//
//  Created by Mac on 29.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FirebaseAuth

private let kFacebookAppID = ""

public class FBAuthManager: ObservableObject {
    public static let shared = FBAuthManager()
    private init() {}
    private let loginManager = LoginManager()
    func login(_ link: Bool = false) {
        Settings.appID = kFacebookAppID
        Settings.displayName = "AuthenticationExample"
        loginManager.logIn(permissions: [.email], viewController: nil) { loginResult in
            switch loginResult {
            case .success(granted: let granted, declined: let declined, token: let token):
                print("Logged in! \(granted) \(declined) \(token)")
                let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                if link {
                    FAuthManager.shared.linkAccount(authCredential: credential)
                } else {
                    FAuthManager.shared.login(with: credential)
                }
            case .cancelled:
                print("User cancelled login.")
            case .failed(let error):
                print(error)
            }
        }
    }
}
