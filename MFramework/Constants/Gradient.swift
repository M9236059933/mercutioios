//
//  Gradient.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftUI
// swiftlint:disable line_length
public extension LinearGradient {
    static let background: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.backgroundS, Color.backgroundE]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let fill: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.fillGradS, Color.fillGradE]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
// swiftlint:enable line_length
