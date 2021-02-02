//
//  Logo.swift
//  Mercutio
//
//  Created by Mac on 30.09.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image.logo
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .foregroundColor(.white)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
