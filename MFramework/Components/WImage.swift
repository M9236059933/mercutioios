//
//  WImage.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

public struct WImage: View {
    var url: String
    public init(_ url: String) {
        self.url = url
    }
    public var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .placeholder(Image("placeholder"))
            .scaledToFit()
    }
}
