//
//  FacebookAuth.swift
//  Mercutio
//
//  Created by Mac on 28.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

let loginButton = FBLoginButton()

func checkAuth() {
    if let token = AccessToken.current, !token.isExpired {
        print("success")
    }
}

func permissions() {
    loginButton.permissions = ["public_profile", "email"]
}
