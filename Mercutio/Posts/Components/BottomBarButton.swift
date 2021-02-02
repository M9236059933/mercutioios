//
//  BottomBarButton.swift
//  Mercutio
//
//  Created by Mac on 30.09.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct BottomBarButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title.uppercased())
                .oswald(17)
                .foregroundColor(.white)
        }
        .frame(height: 50)
        .contentShape(Rectangle())
    }
}

struct BottomBarButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarButton(title: "TEST", action: {})
    }
}
