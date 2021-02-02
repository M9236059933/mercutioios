//
//  Notch.swift
//  MFramework
//
//  Created by Mac on 30.09.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

public extension UIDevice {
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.windows
                .filter({$0.isKeyWindow}).first else { return false }
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
