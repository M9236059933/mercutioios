//
//  Images.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

private enum IMAGE {
    /// images
    static let LOGO: String = "logo"
    static let PLACEHOLDER: String = "placeholder"
    /// icons
    static let ARROW: String = "arrow"
    static let SEARCH: String = "search"
    static let SHARE: String = "share"
    static let STASH: String = "stash"
}

public extension Image {
    /// images
    static let logo: Image = Image(IMAGE.LOGO)
    static let placeholder: Image = Image(IMAGE.PLACEHOLDER)
    /// icons
    static let arrow: Image = Image(IMAGE.ARROW)
    static let search: Image = Image(IMAGE.SEARCH)
    static let share: Image = Image(IMAGE.SHARE)
    static let stash: Image = Image(IMAGE.STASH)
}
