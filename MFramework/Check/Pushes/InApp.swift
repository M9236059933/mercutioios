//
//  InApp.swift
//  MFramework
//
//  Created by Mac on 01.11.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

// in app messages
//func application(_ application: UIApplication,
//didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//  // Uncomment the following line to disable In-App Messaging auto-startup.
//  // InAppMessaging.inAppMessaging().automaticDataCollectionEnabled = false
//
//  FirebaseOptions.defaultOptions()?.deepLinkURLScheme = "com.google.InAppMessagingExampleSwiftiOS"
//  FirebaseApp.configure()
//  return true
//}

//func application(_ app: UIApplication,
//                 open url: URL,
//                 options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//  return application(app,
//                     open: url,
//                     sourceApplication: options[.sourceApplication] as? String,
//                     annotation: options[.annotation] as Any)
//}
//
//func application(_ application: UIApplication,
//                 open url: URL,
//                 sourceApplication: String?,
//                 annotation: Any) -> Bool {
//  let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url)
//
//  if dynamicLink != nil {
//    if dynamicLink?.url != nil {
//      // Handle the deep link. For example, show the deep-linked content,
//      // apply a promotional offer to the user's account or show customized onboarding view.
//      // ...
//    } else {
//      // Dynamic link has empty deep link. This situation will happens if
//      // Firebase Dynamic Links iOS SDK tried to retrieve pending dynamic link,
//      // but pending link is not available for this device/App combination.
//      // At this point you may display default onboarding view.
//    }
//    return true
//  }
//  return false
//}
// in app messages
