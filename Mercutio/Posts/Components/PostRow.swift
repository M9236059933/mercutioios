//
//  PostRow.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

//struct PostRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PostRow(posts[0])
//    }
//}

struct PostRow: View {
    var post: Post
    init(_ post: Post) {
        self.post = post
    }
    // swiftlint:disable line_length
    var linear: some View {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.75), Color.black.opacity(0.0)]), startPoint: .bottom, endPoint: .top)
    }
    // swiftlint:enable line_length
    var body: some View {
        ZStack(alignment: .bottom) {
            WImage(imageURL + post.images[0])
            linear
            text
        }
    }
    var text: some View {
        Text(post.title.uppercased())
            .oswald(16, .medium)
            .center()
            .foregroundColor(.white)
            .padding()
    }
}
