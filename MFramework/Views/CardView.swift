//
//  CardView.swift
//  MFramework
//
//  Created by Mac on 01.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public extension View {
    var cardView: some View {
        Color.white
            .cornerRadius(8.0)
            .background(shadowView, alignment: .bottom)
    }
    func makeCard() -> some View {
        self
            .padding()
            .background(cardView)
    }
}
