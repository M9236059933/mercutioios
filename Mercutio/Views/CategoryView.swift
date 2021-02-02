//
//  CategoryView.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("POPULAR")
            Spacer()
            VStack {
                Text("GEAR")
                Text("STYLE")
                Text("CARS")
                Text("TECH")
                Text("SHELTER")
                Text("VICES")
                Text("ETC")
            }
            Spacer()
            Text("MAGAZINE")
            Spacer()
            Text("SHUFFLE")
            Spacer()
        }
    }
}
