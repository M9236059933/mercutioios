//
//  FirebaseAnalytics.swift
//  Mercutio
//
//  Created by Mac on 27.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI
import UIKit
import FirebaseAnalytics
import FirebaseCrashlytics

func event() {
    Analytics.logEvent("login", parameters: nil)
}

func setUser() {
    Analytics.setUserProperty("Mark", forName: "name")
}

func screen() {
    Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: "LoginScreen"])
}

func crashEvent() {
    Crashlytics.crashlytics().log("Cause Crash button clicked")
}

func crash() {
    crashEvent()
    fatalError()
}

func crashNil() {
    crashEvent()
    let optionalNumber: Int? = nil
    _ = optionalNumber!
}

func crashArray() {
    crashEvent()
    let array: [Int] = [0, 1, 2, 3]
    _ = array[4]
}
