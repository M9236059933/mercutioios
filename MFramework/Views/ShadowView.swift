//
//  ShadowView.swift
//  MFramework
//
//  Created by Mac on 01.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public extension View {
    var shadowView: some View {
        Color.gray.opacity(0.3)
            .frame(height: 44.0)
            .padding(.horizontal, 24)
            .cornerRadius(4.0)
            .offset(y: 8.0)
            .blur(radius: 24)
    }
}
