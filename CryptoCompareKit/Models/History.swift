//
//  History.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 09/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public class History: Decodable {
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
