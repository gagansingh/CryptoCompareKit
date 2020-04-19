//
//  CryptoCompareResponse.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public struct Coins: Decodable {
    public let data: [String: Coin]
    public let response: String
    public let message: String
    public let baseImageUrl: String
    public let baseLinkUrl: String

    private enum CodingKeys: String, CodingKey {
        case data = "Data"
        case response = "Response"
        case message = "Message"
        case baseImageUrl = "BaseImageUrl"
        case baseLinkUrl = "BaseLinkUrl"
    }
}
