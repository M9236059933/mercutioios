//
//  TopBarButton.swift
//  Mercutio
//
//  Created by Mac on 30.09.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct TopBarButton: View {
    var image: Image
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            image
                .resizable()
                .scaledToFit()
                .frame(18, 18)
                .foregroundColor(.white)
        }
        .frame(50, 50)
        .contentShape(Rectangle())
    }
}

struct TopBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TopBarButton(image: Image.stash, action: {})
    }
}
