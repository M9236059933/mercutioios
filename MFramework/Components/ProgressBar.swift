//
//  ProgressBar.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public struct ProgressBar: View {
    var percentage: Double
    public init(_ percentage: Double) {
        self.percentage = percentage
    }
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.fillDisabled)
                Rectangle()
                    .fill(Color.main)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
                    .animation(.default)
            }
            .frame(height: 4.0)
            .cornerRadius(4)
        }
    }
}
