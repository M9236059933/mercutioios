//
//  Font.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public extension Text {
    func font(_ size: CGFloat, _ weight: Font.Weight = .regular) -> some View {
        self.font(.system(size: size, weight: weight, design: .default))
    }
    func oswald(_ size: CGFloat, _ weight: Font.Weight = .regular) -> some View {
        self.font(.custom("Oswald", size: size)).fontWeight(weight)
    }
    func ptserif(_ size: CGFloat, _ weight: Font.Weight = .regular) -> some View {
        self.font(.custom("PTSerif-Regular", size: size))
    }
}
