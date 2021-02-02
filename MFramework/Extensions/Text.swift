//
//  Text.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func singleLine() -> some View {
        self.lineLimit(1)
    }
    func multiline() -> some View {
        self.lineLimit(nil)
    }
    func center() -> some View {
        self.multilineTextAlignment(TextAlignment.center)
    }
    func left() -> some View {
        self.multilineTextAlignment(TextAlignment.leading)
    }
    func right() -> some View {
        self.multilineTextAlignment(TextAlignment.trailing)
    }
}
