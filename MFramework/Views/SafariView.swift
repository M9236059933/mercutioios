//
//  SafariView.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {
    var url: URL
    public init(_ url: URL) {
        self.url = url
    }
    // swiftlint:disable line_length
    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
    // swiftlint:enable line_length
}
