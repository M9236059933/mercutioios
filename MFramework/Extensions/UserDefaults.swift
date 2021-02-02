//
//  UserDefaults.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

public extension Int {
    init?(key: String) {
        guard UserDefaults.standard.value(forKey: key) != nil else { return nil }
        self.init(UserDefaults.standard.integer(forKey: key))
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension Bool {
    init?(_ key: String) {
        guard UserDefaults.standard.value(forKey: key) != nil else { return nil }
        self.init(UserDefaults.standard.bool(forKey: key))
    }
    func store(_ key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension Float {
    init?(key: String) {
        guard UserDefaults.standard.value(forKey: key) != nil else { return nil }
        self.init(UserDefaults.standard.float(forKey: key))
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension Double {
    init?(key: String) {
        guard UserDefaults.standard.value(forKey: key) != nil else { return nil }
        self.init(UserDefaults.standard.double(forKey: key))
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension Data {
    init?(key: String) {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        self.init(data)
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension String {
    init?(key: String) {
        guard let str = UserDefaults.standard.string(forKey: key) else { return nil }
        self.init(str)
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension Array where Element == Any {
    init?(key: String) {
        guard let array = UserDefaults.standard.array(forKey: key) else { return nil }
        self.init()
        self.append(contentsOf: array)
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

public extension Dictionary where Key == String, Value == Any {
    // swiftlint:disable identifier_name
    mutating func merge(dict: [Key: Value]) {
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
    // swiftlint:enable identifier_name
    init?(key: String) {
        guard let dict = UserDefaults.standard.dictionary(forKey: key) else { return nil }
        self.init()
        self.merge(dict: dict)
    }
    func store(key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}
