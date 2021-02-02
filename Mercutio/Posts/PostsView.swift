//
//  PostsView.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostsView()
                .preferredColorScheme(.light)
            PostsView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 8 Plus")
        }
    }
}

struct PostsView: View {
    @ObservedObject var state = PostsState()
    init() {
        state.interactor?.request()
    }
    var header: some View {
        HStack(alignment: .center) {
            TopBarButton(image: Image.search) {state.search()}
            Spacer()
            Logo()
            Spacer()
            TopBarButton(image: Image.stash) {state.stash()}
        }
        .frame(height: 64)
    }
    var list: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(state.posts) { post in
                    PostRow(post)
                        .onTapGesture {
                            state.push(post)
                        }
                }
            }
        }
    }
    var bottom: some View {
        HStack(spacing: 0) {
            BottomBarButton(title: "LATEST") {}
            Spacer()
            BottomBarButton(title: "SUPPLY") {}
            Spacer()
            BottomBarButton(title: "VIDEOS") {}
            Spacer()
            BottomBarButton(title: "STASH") {}
            Spacer()
            BottomBarButton(title: "MORE") {}
        }
        .frame(height: 64)
        .hpadding(32)
    }
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            header
            list
            bottom
        }
        .background(Color.black.safeAreaAll())
    }
}
