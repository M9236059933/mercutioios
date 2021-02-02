//
//  ModalView.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

public class ModalViewModel {
    public init(_ title: String? = nil, _ message: String? = nil, _ button: String? = nil) {
        self.title = title ?? ""
        self.hideTitle = title == nil
        self.message = message ?? ""
        self.hideMessage = message == nil
        self.button = button ?? ""
        self.hideButton = button == nil
    }
    var title: String
    var message: String
    var button: String
    var hideTitle: Bool
    var hideMessage: Bool
    var hideButton: Bool
}

public final class ModalState: ObservableObject {
    @Published var isVisible: Bool = false
    public var modalVM: ModalViewModel = ModalViewModel()
    private init() {}
    public static var shared = ModalState()
    public func show() {
        isVisible = true
    }
    public func hide() {
        isVisible = false
    }
}

public struct ModalView<Content: View>: View {
    private var content: Content
    @ObservedObject var modal: ModalState = ModalState.shared
    public init(content: Content) {
        self.content = content
    }
    public var body : some View {
        content
            .sheet(isPresented: $modal.isVisible) {
                ModalContentView(self.modal.modalVM) {
                    self.modal.hide()
                }
        }
    }
}

struct ModalContentView: View {
    var modalVM: ModalViewModel
    let close: () -> Void
    public init(_ modalVM: ModalViewModel, close: @escaping () -> Void) {
        self.modalVM = modalVM
        self.close = close
    }
    var body: some View {
        VStack {
            if !modalVM.hideTitle {
                Text(modalVM.title)
            }
            if !modalVM.hideMessage {
                Text(modalVM.message)
            }
            if !modalVM.hideTitle {
                Button(action: {
                    self.close()
                }) {
                    Text(modalVM.button)
                }
            }
        }
    }
}
