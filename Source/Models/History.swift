//
//  History.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 09/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public struct History: Decodable {
    public let time: Double
    public let close: Double
    public let high: Double
    public let low: Double
    public let open: Double
    public let volumeFrom: Double
    public let volumeTo: Double

    private enum CodingKeys: String, CodingKey {
        case time = "time"
        case close = "close"
        case high = "high"
        case low = "low"
        case open = "open"
        case volumeFrom = "volumefrom"
        case volumeTo = "volumeto"
    }
}

public struct HistoricalDayAvg: Decodable {
    public let tsym: Double
    public let conversionType: [String: String]

    private struct Key: CodingKey, Hashable, CustomStringConvertible {
        static let meta = Key(stringValue: "ConversionType")!
        var description: String {
            return stringValue
        }

//        var hashValue: Int { return stringValue.hash }

        static func == (lhs: Key, rhs: Key) -> Bool {
            return lhs.stringValue == rhs.stringValue
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(stringValue)
        }

        let stringValue: String
        init(_ string: String) { self.stringValue = string }
        init?(stringValue: String) { self.init(stringValue) }
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)

        conversionType = try container.decode([String: String].self, forKey: .meta)

        guard let dynamicKey = container.allKeys.first(where: { $0 != .meta }) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [],
                                                    debugDescription: "Could not find dynamic key"))
        }

        tsym = try container.decode(Double.self, forKey: dynamicKey)
    }
}
