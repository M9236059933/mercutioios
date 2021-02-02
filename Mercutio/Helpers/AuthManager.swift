//
//  AuthManager.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import LocalAuthentication

struct User {
    var email: String
}

public class AuthState: ObservableObject {
    static let shared = AuthState()
    private init() {}
    typealias Completion = (Bool) -> Void
    @Published var user: User?
    @Published var isAuth = false
    func getBiometryType() -> LABiometryType {
        let context = LAContext()
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        return context.biometryType
    }
    func getBiometryTypeString() -> String {
        let biometryType = getBiometryType()
        switch biometryType {
        case .none:
            return ""
        case .faceID:
            return "Face ID"
        case .touchID:
            return "Touch ID"
        default:
            return ""
        }
    }
    func touchID(_ completion: @escaping Completion) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "To access your account.") { success, error in
                print(error?.localizedDescription as Any)
                DispatchQueue.main.async {
                    if success {
                        completion(true)
                        return
                    } else {
                        // "Authentication failed", "You could not be verified; please try again."
                        completion(false)
                        return
                    }
                }
            }
        } else {
            // "Biometry unavailable", "Your device is not configured for biometric authentication."
            completion(false)
            return
        }
    }
    func login(_ completion: @escaping Completion) {}
    func signup(_ completion: @escaping Completion) {}
    func forgot(_ completion: @escaping Completion) {}
    func logout(_ completion: @escaping Completion) {}
}
