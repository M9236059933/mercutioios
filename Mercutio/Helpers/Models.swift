//
//  Models.swift
//  Mercutio
//
//  Created by Mac on 11.08.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct Post: Hashable, Codable, Identifiable, Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
    // swiftlint:disable identifier_name
    var id: Int
    // swiftlint:enable identifier_name
    var title: String
    var description: String
    var buyUrl: String
    var buyTitle: String
    var watches: Int
    var images: [String]
    var category: Category
}
// swiftlint:disable line_length
extension Post {
    static let preview = Post(
        id: 1,
        title: "2021 BENTLEY BENTAYGA SPEED SUV",
        description: "Despite competition from Italy, Germany, and in-country rivals Rolls-Royce, the fastest, most luxurious SUV in the world still comes from only one place — Crewe, County Cheshire, England. Bentley has unveiled the 2021 Bentayga Speed, packing the previous Bentayga Speed's turbocharged W12 in the heavily revised styling, making for a stunning combination of looks and performance. While the W12 is unchanged, its 626 horsepower and 664 lb-ft of torque are enough to push the Bentayga from 0-62 MPH in 3.9 seconds and on to a top speed of 190 MPH. Inside the cabin, however, it's entirely possible one might not notice the velocity. Swathed in Alcantara or leather at the customer's choice, the Bentayga Speed combines the modern and traditional with a configurable digital dash and handcrafted opulence. The Bentayga Speed will also be available in a Black Edition, with the SUV arriving in dealers in early 2021.",
        buyUrl: "https://www.bentleymotors.com/en/models/new-bentayga/new-bentayga-speed.html",
        buyTitle: "BUY FROM BENTLEY / $245,000",
        watches: 9,
        images: [
            "bentley-bentayga-speed-1.jpg",
            "bentley-bentayga-speed-2.jpg",
            "bentley-bentayga-speed-3.jpg",
            "bentley-bentayga-speed-4.jpg",
            "bentley-bentayga-speed-5.jpg"
        ],
        category: Category(title: "Suvs & Trucks", url: "suvs-trucks", parent: Category(title: "Cars", url: "cars", parent: nil)))
}
// swiftlint:enable line_length
class Category: Codable, Hashable, Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.url == rhs.url
    }
    init(title: String, url: String, parent: Category?) {
        self.title = title
        self.url = url
        self.parent = parent
    }
    var title: String
    var url: String
    var parent: Category?
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
}

struct PostAPI: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Post]
}
