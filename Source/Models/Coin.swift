//
//  TestCoin.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public struct Coin: Decodable {
    public let id: String?
    public let url: String?
    public let imageUrl: String?
    public let name: String?
    public let symbol: String?
    public let coinName: String?
    public let fullName: String?
    public let algorithm: String?
    public let proofType: String?
    public let fullyPremined: String?
    public let totalCoinSupply: String?
    public let builtOn: String?
    public let smartContractAddress: String?
    public let preMinedValue: String?
    public let totalCoinsFreeFloat: String?
    public let sortOrder: String?
    public let sponsored: Bool?
    public let isTrading: Bool?
    public let totalCoinsMined: Double?
    public let blockNumber: Double?
    public let netHashesPerSecond: Double?
    public let blockReward: Double?
    public let blockTime: Double?

    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case imageUrl = "ImageUrl"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case fullyPremined = "FullyPremined"
        case totalCoinSupply = "TotalCoinSupply"
        case builtOn = "BuiltOn"
        case smartContractAddress = "SmartContractAddress"
        case preMinedValue = "PreMinedValue"
        case totalCoinsFreeFloat = "TotalCoinsFreeFloat"
        case sortOrder = "SortOrder"
        case sponsored = "Sponsored"
        case isTrading = "IsTrading"
        case totalCoinsMined = "TotalCoinsMined"
        case blockNumber = "BlockNumber"
        case netHashesPerSecond = "NetHashesPerSecond"
        case blockReward = "BlockReward"
        case blockTime = "BlockTime"
    }
}
