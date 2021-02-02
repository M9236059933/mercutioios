//
//  Instabug.swift
//  Mercutio
//
//  Created by Mac on 27.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//import Instabug
import Alamofire

let prodToken: String = ""
let devToken: String = ""
func initInstabug() {
//    Instabug.start(withToken: isRunningLive() ? prodToken : devToken, invocationEvents: [.shake])
//    BugReporting.shouldCaptureViewHierarchy = true
//    BugReporting.enabled = true
//    CrashReporting.enabled = true
//    APM.appLaunchEnabled = true
}

func isRunningLive() -> Bool {
    #if targetEnvironment(simulator)
    return false
    #else
    let isRunningTestFlightBeta = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
    let hasEmbeddedMobileProvision = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil
    return isRunningTestFlightBeta || hasEmbeddedMobileProvision
    #endif
}
