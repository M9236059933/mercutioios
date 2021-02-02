//
//  FirebaseConfig.swift
//  Mercutio
//
//  Created by Mac on 27.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI
import FirebaseRemoteConfig

public struct ConfigManager {
    private var remoteConfig: RemoteConfig = RemoteConfig.remoteConfig()
    public static let shared = ConfigManager()
    private init() {
        setupRemoteConfig()
    }
    private func setupRemoteConfig() {
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    public func getAnalytics() -> Bool {
        return remoteConfig["analytics"].boolValue
    }
    public func fetchAndActivateRemoteConfig() {
        remoteConfig.fetchAndActivate { status, error in
            print(status)
            guard error == nil else { return
                print(error ?? "")
            }
            print("Remote config successfully fetched & activated!")
            DispatchQueue.main.async {
                print("Update UI")
            }
        }
    }
}
