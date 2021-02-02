//
//  SpashView.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public final class SplashState: ObservableObject {
    @Published var isVisible: Bool = false
    private init() {}
    public static var shared = SplashState()
    public func show() {
        isVisible = true
    }
    public func hide() {
        isVisible = false
    }
}

public struct SplashView<Content: View>: View {
    private var content: Content
    @ObservedObject var splash: SplashState = SplashState.shared
    public init(content: Content) {
        self.content = content
    }
    public var body : some View {
        ZStack {
            content
            if splash.isVisible {
                Color.black
            }
        }
    }
}
