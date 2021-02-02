//
//  Google.swift
//  Mercutio
//
//  Created by Mac on 29.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//import GoogleSignIn
import Firebase

extension AppDelegate {
    func initGoogle() {
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()!.options.clientID
//        GIDSignIn.sharedInstance().delegate = GAuthManager.shared
    }
}

extension SceneDelegate {
    func setupGoogle() {
//        GIDSignIn.sharedInstance().presentingViewController = window?.rootViewController
    }
}

extension SceneDelegate {
    func setupApple() {
        AAuthManager.shared.presentationAnchor = window
    }
}

extension SceneDelegate {
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        if let incomingURL = userActivity.webpageURL {
            handleIncomingDynamicLink(incomingURL)
        }
    }
    func handleIncomingDynamicLink(_ incomingURL: URL) {
        DynamicLinks.dynamicLinks().handleUniversalLink(incomingURL) { dynamicLink, error in
            guard error == nil else {
                return print("ⓧ Error in \(#function): \(error!.localizedDescription)")
            }
            guard let link = dynamicLink?.url?.absoluteString else { return }
            if Auth.auth().isSignIn(withEmailLink: link) {
                UserDefaults.standard.set(link, forKey: "Link")
                NotificationCenter.default
                    .post(Notification(name: .PasswordlessEmailNotificationSuccess))
            }
        }
    }
    @objc func passwordlessSignIn(_ link: Bool = false) {
        guard let email = linkEmail,
              let storelink = UserDefaults.standard.value(forKey: "Link") as? String else { return }
        if link {
            let credential = EmailAuthProvider.credential(withEmail: email, link: storelink)
            Auth.auth().currentUser?.link(with: credential) { result, error in
                guard error == nil else { return }
                print(result?.additionalUserInfo as Any)
                print(result?.credential as Any)
                print(error?.asAFError as Any)
                linkEmail = nil
            }
        } else {
            Auth.auth().signIn(withEmail: email, link: storelink) { result, error in
                print(result?.additionalUserInfo as Any)
                print(result?.credential as Any)
                print(error?.asAFError as Any)
                guard error == nil else { return }
                guard let currentUser = Auth.auth().currentUser else { return }
                if currentUser.isEmailVerified {
                    print("User verified with passwordless email.")
                } else {
                    print("User could not be verified by passwordless email")
                }
            }
        }
    }
    func registerForLoginNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(passwordlessSignIn),
            name: .PasswordlessEmailNotificationSuccess,
            object: nil
        )
    }
}
