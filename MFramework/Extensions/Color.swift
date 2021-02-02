//
//  Color.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI
import UIKit
// swiftlint:disable large_tuple
private func getARGB(_ hex: String) -> (a: UInt64, r: UInt64, g: UInt64, b: UInt64) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    // swiftlint:disable identifier_name
    let a, r, g, b: UInt64
    // swiftlint:enable identifier_name
    switch hex.count {
    case 3:
        (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:
        (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:
        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
        (a, r, g, b) = (255, 0, 0, 0)
    }
    return (a, r, g, b)
}
// swiftlint:enable large_tuple
public extension Color {
    init(_ hex: String) {
        let argb = getARGB(hex)
        self.init(
            .sRGB,
            red: Double(argb.r) / 255,
            green: Double(argb.g) / 255,
            blue: Double(argb.b) / 255,
            opacity: Double(argb.a) / 255
        )
    }
}

public extension UIColor {
    convenience init(_ hex: String) {
        let argb = getARGB(hex)
        self.init(
            red: CGFloat(argb.r) / 255,
            green: CGFloat(argb.g) / 255,
            blue: CGFloat(argb.b) / 255,
            alpha: CGFloat(argb.a) / 255)
    }
}
