//
//  RootView.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            TabView {
                PostsView()
                    .tabItem {
                        Text("LATEST")
                }
                SupplyView()
                    .tabItem {
                        Text("SUPPLY")
                }
                VideosView()
                    .tabItem {
                        Text("VIDEOS")
                }
                StashView()
                    .tabItem {
                        Text("STASH")
                }
                CategoryView()
                    .tabItem {
                        Text("MORE")
                }
            }
            .navigationBarItems(leading:
                Button("Seacrh") {}, trailing:
                Button("Cart") {})
                .navigationBarTitle("MERCUTIO", displayMode: .inline)
        }
    }
}
