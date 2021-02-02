//
//  LoginView.swift
//  Mercutio
//
//  Created by Mac on 09.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginView: View {
    @ObservedObject var state = LoginState()
    init() {}
    var emailField: some View {
        TextField(state.emailPlaceholder, text: $state.email)
    }
    var passwordField: some View {
        SecureField(state.passwordPlaceholder, text: $state.password)
    }
    var loginButton: some View {
        Button(action: {
            self.state.login()
        }) {
            Text(state.loginButton)
        }
        .disabled(state.disabled)
    }
    var body: some View {
        VStack(spacing: 32) {
            emailField
            passwordField
            loginButton
        }
        .padding()
    }
}
