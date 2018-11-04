//
//  TestCoin.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public struct Coin: Decodable {
    public let fullName: String
    public let sortOrder: String
    
    private enum CodingKeys : String, CodingKey {
        case fullName = "FullName"
        case sortOrder = "SortOrder"
    }
}
