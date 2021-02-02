//
//  Firebase.swift
//  Mercutio
//
//  Created by Mac on 27.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Firebase

func initFirebaseConfig() {
    FirebaseApp.configure()
    Analytics.setAnalyticsCollectionEnabled(false)
    Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(false)
}
