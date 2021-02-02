//
//  LoadingView.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public final class LoadingState: ObservableObject {
    @Published var isVisible: Bool = false
    private init() {}
    public static var shared = LoadingState()
    public func show() {
        isVisible = true
    }
    public func hide() {
        delay(0.5) {
            self.isVisible = false
        }
    }
}

public struct LoadingView<Content: View>: View {
    private var content: Content
    @ObservedObject var loading: LoadingState = LoadingState.shared
    public init(content: Content) {
        self.content = content
    }
    public var body : some View {
        ZStack {
            content
                .overlay(loading.isVisible ? Color.black.opacity(0.5) : Color.clear)
                .blur(radius: loading.isVisible ? 3 : 0)
                .disabled(loading.isVisible)
            if loading.isVisible {
                IndicatorLottie()
                    .frame(100, 100)
            }
        }
    }
}
