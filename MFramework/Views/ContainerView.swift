//
//  ContainerView.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public struct ContainerView<Content: View>: View {
    private var content: Content
    public init(content: Content) {
        self.content = content
    }
    public var body : some View {
        LoadingView(content: ModalView(content: content))
    }
}
