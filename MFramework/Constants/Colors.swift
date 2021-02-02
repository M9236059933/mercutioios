//
//  Colors.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI
// swiftlint:disable identifier_name
private enum  COLOR {
    /// Background
    static let BACKGROUND_S = "BackgroundS"
    static let BACKGROUND_E = "BackgroundE"
    /// Foreground
    static let FILL_GRAD_S = "FillGradS"
    static let FILL_GRAD_E = "FillGradE"
    static let FILL_DISABLED = "FillDisabled"
    static let FILL_WHITE = "FillWhite"
    /// Text Color
    static let MAIN = "Main"
    static let SUCCESS = "Success"
    static let ERROR = "Error"
    static let WARNING = "Warning"
    /// Text
    static let PRIMARY = "Primary"
    static let REGULAR = "Regular"
    static let SECONDARY = "Secondary"
    static let PLACEHOLDER = "Placeholder"
}
// swiftlint:enable identifier_name
public extension UIColor {
    /// Background
    static let backgroundS = UIColor(named: COLOR.BACKGROUND_S)!
    static let backgroundE = UIColor(named: COLOR.BACKGROUND_E)!
    /// Foreground
    static let fillGradS = UIColor(named: COLOR.FILL_GRAD_S)!
    static let fillGradE = UIColor(named: COLOR.FILL_GRAD_E)!
    static let fillDisabled = UIColor(named: COLOR.FILL_DISABLED)!
    static let fillWhite = UIColor(named: COLOR.FILL_WHITE)!
    /// Text Color
    static let main = UIColor(named: COLOR.MAIN)!
    static let success = UIColor(named: COLOR.SUCCESS)!
    static let error  = UIColor(named: COLOR.ERROR)!
    static let warning = UIColor(named: COLOR.WARNING)!
    /// Text
    static let mprimary = UIColor(named: COLOR.PRIMARY)!
    static let regular = UIColor(named: COLOR.REGULAR)!
    static let msecondary = UIColor(named: COLOR.SECONDARY)!
    static let placeholder = UIColor(named: COLOR.PLACEHOLDER)!
}

public extension Color {
    /// Background
    static let backgroundS = Color(UIColor.backgroundS)
    static let backgroundE = Color(UIColor.backgroundE)
    /// Foreground
    static let fillGradS = Color(UIColor.fillGradS)
    static let fillGradE = Color(UIColor.fillGradE)
    static let fillDisabled = Color(UIColor.fillDisabled)
    static let fillWhite = Color(UIColor.fillWhite)
    /// Text Color
    static let main: Color = Color(UIColor.main)
    static let success: Color = Color(UIColor.success)
    static let error: Color  = Color(UIColor.error)
    static let warning: Color = Color(UIColor.warning)
    /// Text
    static let mprimary: Color = Color(UIColor.mprimary)
    static let regular: Color = Color(UIColor.regular)
    static let msecondary: Color  = Color(UIColor.msecondary)
    static let placeholder: Color = Color(UIColor.placeholder)
}
