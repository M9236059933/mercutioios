//
//  View.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func hpadding(_ length: CGFloat? = nil) -> some View {
        self.padding(.horizontal, length)
    }
    func vpadding(_ length: CGFloat? = nil) -> some View {
        self.padding(.vertical, length)
    }
    func listCleanRow() -> some View {
        self.listRowInsets(EdgeInsets.init())
    }
    func maxWidth() -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity)
    }
    func maxHeight() -> some View {
        self.frame(minHeight: 0, maxHeight: .infinity)
    }
    func maxScreen() -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    func safeAreaAll() -> some View {
        self.edgesIgnoringSafeArea(.all)
    }
    func frame(_ width: CGFloat?, _ height: CGFloat?) -> some View {
        self.frame(width: width, height: height)
    }
    typealias ContentTransform<Content: View> = (Self) -> Content
    @ViewBuilder func conditionalModifier<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        ifTrue: ContentTransform<TrueContent>,
        ifFalse: ContentTransform<FalseContent>) -> some View {
        if condition {
            ifTrue(self)
        } else {
            ifFalse(self)
        }
    }
    @ViewBuilder func isHidden(_ hidden: Bool, _ remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
