//
//  GAuthManager.swift
//  MFramework
//
//  Created by Mac on 29.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

public class GAuthManager: NSObject, ObservableObject, GIDSignInDelegate {
    public let link = false
    public static let shared = GAuthManager()
    private override init() {}
    func login() {
        GIDSignIn.sharedInstance().signIn()
    }
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else { return }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        if link {
            FAuthManager.shared.linkAccount(authCredential: credential)
        } else {
            FAuthManager.shared.login(with: credential)
        }
    }
}
