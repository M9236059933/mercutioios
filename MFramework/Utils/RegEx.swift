//
//  RegEx.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

public enum RegExType: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case phone = "^[0-9]{10}$"
    case zip = "^[0-9]{5}(-[0-9]{4})?$"
    case number = ".*[0-9]+.*"
    case capital = ".*[A-Z]+.*"
    case special = ".*[$@$!%*#?&]+.*"
    case nine = "^{8,}$"
    case password = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z0-9$@$!%*#?&]{8,}$"
    case code = "^[0-9]{4}$"
}

public struct RegEx {
    public static func validate(_ string: String, _ type: RegExType) -> Bool {
        let pred = NSPredicate(format: "SELF MATCHES %@", type.rawValue)
        return pred.evaluate(with: string)
    }
}
