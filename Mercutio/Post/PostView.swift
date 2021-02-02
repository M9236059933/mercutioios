//
//  PostView.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(posts[0])
//    }
//}

struct PostView: View {
    @ObservedObject var state: PostState
    init(_ post: Post) {
        state = PostState(post)
    }
    var header: some View {
        HStack(alignment: .center) {
            TopBarButton(image: Image.arrow) {state.back()}
            Spacer()
            Logo()
            Spacer()
            TopBarButton(image: Image.share) {state.share()}
        }
        .frame(height: 64)
    }
    var gallery: some View {
        // MARK: fix make here
        WImage(imageURL + state.post.images[0])
            .onTapGesture {
                state.showImageViewer()
            }
    }
    var categories: some View {
        HStack {
            CategoryLabel(title: state.categoryMain) {state.main()}
            Text(state.slash)
                .oswald(14, .medium)
                .vpadding(6)
            CategoryLabel(title: state.categorySub) {state.sub()}
        }
        .foregroundColor(.placeholder)
        .maxWidth()
    }
    var title: some View {
        Text(state.post.title)
            .foregroundColor(Color.mprimary)
            .oswald(20, .medium)
            .center()
            .maxWidth()
            .hpadding()
            .padding(.bottom, 6)
    }
    var description: some View {
        Text(state.post.description)
            .foregroundColor(Color.mprimary)
            .ptserif(18)
            .center()
            .hpadding()
            .padding(.bottom, 20)
    }
    var bottom: some View {
        HStack {
            BottomBarButton(title: state.post.buyTitle) {state.buy()}
            Text(state.or)
                .ptserif(14)
                .foregroundColor(.white)
                .vpadding()
            BottomBarButton(title: state.stashButton) {state.stash()}
        }
        .frame(height: 64)
        .padding(.horizontal)
    }
    // swiftlint:disable line_length
    var linear: some View {
        LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .bottom, endPoint: .top)
            .frame(height: 40)
    }
    // swiftlint:enable line_length
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            header
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 0) {
                    gallery
                        .padding(.bottom, 6)
                    categories
                    title
                    description
                }
            }
            .background(Color.white)
            .overlay(linear, alignment: .bottom)
            bottom
        }
        .background(Color.black.safeAreaAll())
    }
}
