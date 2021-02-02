//
//  Logs.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

#if DEBUG
private let showLogs: Bool = true
#else
private let showLogs: Bool = false
#endif

public func logs(_ data: Any) {
    if showLogs { print(data) }
}
