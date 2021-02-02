//
//  BackgroundView.swift
//  MFramework
//
//  Created by Mac on 01.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public extension View {
    var backgroundView: some View {
        Color.gray.opacity(0.1)
            .edgesIgnoringSafeArea(.all)
    }
}
