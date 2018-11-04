//
//  PriceMultiFull.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public struct PriceMultiFull: Decodable {
    public let raw: [String: [String: Raw]]
    public let display: [String: [String: Display]]
    
    private enum CodingKeys : String, CodingKey {
        case raw = "RAW"
        case display = "DISPLAY"
    }
}

public struct PriceGenerateAverage: Decodable {
    public let raw: AverageRaw
    public let display: AverageDisplay
    
    private enum CodingKeys : String, CodingKey {
        case raw = "RAW"
        case display = "DISPLAY"
    }
}

public struct AverageRaw: Decodable {
    public let MARKET: String
    public let FROMSYMBOL: String
    public let TOSYMBOL: String
    public let FLAGS: Double
    public let PRICE: Double
    public let LASTUPDATE: Double
    public let LASTVOLUME: Double
    public let LASTVOLUMETO: Double
    public let LASTTRADEID: String
    public let VOLUME24HOUR: Double
    public let VOLUME24HOURTO: Double
    public let OPEN24HOUR: Double
    public let HIGH24HOUR: Double
    public let LOW24HOUR: Double
    public let LASTMARKET: String
    public let CHANGE24HOUR: Double
    public let CHANGEPCT24HOUR: Double
    public let CHANGEDAY: Double
    public let CHANGEPCTDAY: Double
}

public struct AverageDisplay: Decodable {
    public let FROMSYMBOL: String
    public let TOSYMBOL: String
    public let MARKET:  String
    public let PRICE:  String
    public let LASTUPDATE:  String
    public let LASTVOLUME: String
    public let LASTVOLUMETO: String
    public let LASTTRADEID:  String
    public let VOLUME24HOUR:  String
    public let VOLUME24HOURTO:  String
    public let OPEN24HOUR:  String
    public let HIGH24HOUR:  String
    public let LOW24HOUR:  String
    public let LASTMARKET:  String
    public let CHANGE24HOUR:  String
    public let CHANGEPCT24HOUR:  String
    public let CHANGEDAY:  String
    public let CHANGEPCTDAY:  String
}

public struct Raw: Decodable {
    public let TYPE: String?
    public let MARKET: String?
    public let FROMSYMBOL:  String?
    public let TOSYMBOL:  String?
    public let FLAGS:  String?
    public let PRICE: Double?
    public let LASTUPDATE: Double?
    public let LASTVOLUME: Double?
    public let LASTVOLUMETO: Double?
    public let LASTTRADEID:  String?
    public let VOLUMEDAY: Double?
    public let VOLUMEDAYTO: Double?
    public let VOLUME24HOUR: Double?
    public let VOLUME24HOURTO: Double?
    public let OPENDAY: Double?
    public let HIGHDAY: Double?
    public let LOWDAY: Double?
    public let OPEN24HOUR: Double?
    public let HIGH24HOUR: Double?
    public let LOW24HOUR: Double?
    public let LASTMARKET:  String?
    public let CHANGE24HOUR: Double?
    public let CHANGEPCT24HOUR: Double?
    public let CHANGEDAY: Double?
    public let CHANGEPCTDAY: Double?
    public let SUPPLY: Double?
    public let MKTCAP: Double?
    public let TOTALVOLUME24H: Double?
    public let TOTALVOLUME24HTO: Double?
}

public struct Display: Decodable {
    public let FROMSYMBOL: String
    public let TOSYMBOL:  String
    public let MARKET:  String
    public let PRICE:  String
    public let LASTUPDATE:  String
    public let LASTVOLUME:  String
    public let LASTVOLUMETO:  String
    public let LASTTRADEID:  String
    public let VOLUMEDAY:  String
    public let VOLUMEDAYTO:  String
    public let VOLUME24HOUR:  String
    public let VOLUME24HOURTO:  String
    public let OPENDAY:  String
    public let HIGHDAY:  String
    public let LOWDAY:  String
    public let OPEN24HOUR:  String
    public let HIGH24HOUR:  String
    public let LOW24HOUR:  String
    public let LASTMARKET:  String
    public let CHANGE24HOUR:  String
    public let CHANGEPCT24HOUR:  String
    public let CHANGEDAY:  String
    public let CHANGEPCTDAY:  String
    public let SUPPLY:  String
    public let MKTCAP:  String
    public let TOTALVOLUME24H:  String
    public let TOTALVOLUME24HTO:  String
}
