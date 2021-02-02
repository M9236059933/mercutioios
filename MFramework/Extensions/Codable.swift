//
//  Codable.swift
//  MFramework
//
//  Created by Mac on 02.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON

public extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization
                .jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

public extension Decodable {
    init(fromDictionary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}

public struct CodableJSON {
    public static func decodeJson<Element: Codable>(_ json: JSON) -> Element? {
        if let rawData = getRawData(json) {
            do {
                let items = try JSONDecoder().decode(Element.self, from: rawData)
                return items
            } catch let error as NSError {
                logs(error)
                logs("Failed to decode from \(rawData)")
                return nil
            }
        } else {
            return nil
        }
    }
    public static func encodeJson<Element: Codable>(_ items: Element) -> JSON? {
        do {
            let encodedData = try JSONEncoder().encode(items)
            return JSON(encodedData)
        } catch let error as NSError {
            logs(error)
            logs("Failed to encode \(items)")
            return nil
        }
    }
    private static func getRawData(_ json: JSON) -> Data? {
        do {
            let rawData = try json.rawData()
            return rawData
        } catch let error as NSError {
            logs(error)
            logs("Failed to rawData from \(json)")
            return nil
        }
    }
}
