//
//  FAuthManager.swift
//  Mercutio
//
//  Created by Mac on 28.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDynamicLinks

var handle: AuthStateDidChangeListenerHandle?

enum AuthProvider: String {
    case apple = "apple.com"
    case facebook = "facebook.com"
    case google = "google.com"
    case email = "email"
    case phone = "phone"
    case link = "link"
    case anonymous = "anonymous"
}

var user: User?
var verificationID: String?
public var linkEmail: String?
private var oauthProvider: OAuthProvider!
public struct FAuthManager {
    public static let shared = FAuthManager()
    private init() {}
    // Auth
    public func signup(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else { return }
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func login(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else { return }
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func loginAnon() {
        Auth.auth().signInAnonymously { result, error in
            guard error == nil else { return }
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func reset(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { error in
            guard error == nil else { return }
        })
    }
    public func logout() {
        try? Auth.auth().signOut()
    }
    // OAuth2
    public func login(token: String) {
        Auth.auth().signIn(withCustomToken: token) { result, error in
            guard error == nil else { return }
            print(result as Any)
        }
    }
    // User
    public func getUser() {
        if let currentUser = Auth.auth().currentUser {
            user = currentUser
            print(currentUser.uid)
            print(currentUser.email as Any)
            print(currentUser.photoURL as Any)
            for item in currentUser.providerData {
                print(item.providerID)
                print(item.uid)
            }
            var multiFactorString = "MultiFactor: "
            for info in currentUser.multiFactor.enrolledFactors {
                multiFactorString += info.displayName ?? "[DispayName]"
                multiFactorString += " "
            }
            print(multiFactorString)
        }
    }
    public func reauthenticateUser(_ credential: AuthCredential) {
        user?.reauthenticate(with: credential) { result, error in
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func reloadUser() {
        user?.reload { error in
            if let error = error {
                print(error)
            }
        }
    }
    public func deleteUser() {
        user?.delete { error in
            guard error == nil else { return }
        }
    }
    public func requestVerifyEmail() {
        user?.sendEmailVerification { error in
            guard error == nil else { return }
            print("Verification email sent!")
        }
    }
    public func refreshCurrentUserIDToken() {
        let forceRefresh = true
        user?.getIDTokenForcingRefresh(forceRefresh) { token, error in
            guard error == nil else { return }
            if let token = token {
                print("New token: \(token)")
            }
        }
    }
    public func updateUserDisplayName(to newDisplayName: String) {
        let changeRequest = user?.createProfileChangeRequest()
        changeRequest?.displayName = newDisplayName
        changeRequest?.commitChanges { error in
            guard error == nil else { return }
        }
    }
    public func updateUserEmail(to newEmail: String) {
        user?.updateEmail(to: newEmail, completion: { error in
            guard error == nil else { return }
        })
    }
    public func updateUserPassword(to newPassword: String) {
        user?.updatePassword(to: newPassword, completion: { error in
            guard error == nil else { return }
        })
    }
    public func updatePhotoURL(to newPhotoURL: String) {
        guard let newPhotoURL = URL(string: newPhotoURL) else {
            print("Could not create new photo URL!")
            return
        }
        let changeRequest = user?.createProfileChangeRequest()
        changeRequest?.photoURL = newPhotoURL
        changeRequest?.commitChanges { error in
            guard error == nil else { return }
        }
    }
    public func linkEmailAccount(email: String, password: String) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        linkAccount(authCredential: credential)
    }
    public func linkAccount(authCredential: AuthCredential) {
        user?.link(with: authCredential) { result, error in
            guard error == nil else { return }
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func unlinkFromProvider(_ providerID: String) {
        user?.unlink(fromProvider: providerID) { user, error in
            guard error == nil else { return }
            print(user as Any)
            print("Unlinked user from auth provider: \(providerID)")
        }
    }
    // Phone
    public func signupPhone(_ phoneNumber: String) {
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        let phoneNumber = String(format: "+%@", phoneNumber)
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { vid, error in
                guard error == nil else { return }
                guard let getVerificationID = vid else { return }
                verificationID = getVerificationID
                UserDefaults.standard.set(verificationID, forKey: "verificationID")
            }
    }
    public func confirmCode(_ verificationCode: String, _ link: Bool = false) {
        guard let verificationID = UserDefaults.standard.string(forKey: "verificationID") else { return }
        let credential = PhoneAuthProvider.provider()
            .credential(withVerificationID: verificationID, verificationCode: verificationCode)
        if link {
            linkAccount(authCredential: credential)
        } else {
            login(with: credential)
        }
    }
    // OAuth
    // Fix public
    func loginOAuth(for provider: AuthProvider, _ link: Bool = false) {
        oauthProvider = OAuthProvider(providerID: provider.rawValue)
        oauthProvider.getCredentialWith(nil) { credential, error in
            guard error == nil else { return }
            guard let credential = credential else { return }
            if link {
                linkAccount(authCredential: credential)
            } else {
                login(with: credential)
            }
        }
    }
    // Handler
    public func onAppear() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print(auth)
            print(user as Any)
        }
    }
    public func onDisppear() {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}

// Link

extension FAuthManager {
    public func sendSignInLink(to email: String) {
        let actionCodeSettings = ActionCodeSettings()
        let stringURL = "https://firebaseapp.com?email=\(email)"
//        let stringURL = "https://mercutioapp.page.link/demo"
        actionCodeSettings.url = URL(string: stringURL)
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings) { error in
            print()
            guard error == nil else { return }
            linkEmail = email
        }
    }
    public func loginLink(_ email: String, _ link: String) {
        Auth.auth().signIn(withEmail: email, link: link) { result, error in
            guard error == nil else { return }
            print(result?.additionalUserInfo as Any)
            print(result?.credential as Any)
            print(error as Any)
        }
    }
    public func openSignInLink(_ url: URL, _ email: String) {
        let link = url.absoluteString
        if Auth.auth().isSignIn(withEmailLink: link) {
            loginLink(email, link)
        }
    }
}

public extension Notification.Name {
    static let PasswordlessEmailNotificationSuccess = Notification.Name("PasswordlessEmailNotificationSuccess")
}
