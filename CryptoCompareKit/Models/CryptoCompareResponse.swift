//
//  CryptoCompareResponse.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

struct CryptoCompareResponse<T: Decodable>: Decodable {
    let data: T?
    let response: String
    let message: String
    let baseImageUrl: String
    let baseLinkUrl: String
    
    private enum CodingKeys : String, CodingKey {
        case data = "Data"
        case response = "Response"
        case message = "Message"
        case baseImageUrl = "BaseImageUrl"
        case baseLinkUrl = "BaseLinkUrl"
    }
}

public struct CryptoCompareEmptyResponse: Decodable { }
