//
//  CategoryLabel.swift
//  Mercutio
//
//  Created by Mac on 30.09.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct CategoryLabel: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title.uppercased())
                .foregroundColor(.placeholder)
                .oswald(14, .medium)
        }
        .frame(height: 32)
        .contentShape(Rectangle())
    }
}

struct CategoryLabel_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLabel(title: "", action: {})
    }
}
