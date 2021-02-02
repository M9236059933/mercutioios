//
//  AppState.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

final class AppState: ObservableObject {
    private init() {}
    public static var shared = AppState()
}
