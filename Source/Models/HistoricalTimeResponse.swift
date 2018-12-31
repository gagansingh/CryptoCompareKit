//
//  HistoricalTimeResponse.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 09/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public struct HistoricalTimeResponse: Decodable {
    public let data: [History]
    public let response: String
    public let type: Double
    public let aggregated: Bool
    public let timeTo: Double
    public let timeFrom: Double
    public let firstValueInArray: Bool
    public let conversionType: [String: String]

    private enum CodingKeys: String, CodingKey {
        case data = "Data"
        case response = "Response"
        case type = "Type"
        case aggregated = "Aggregated"
        case timeTo = "TimeTo"
        case timeFrom = "TimeFrom"
        case firstValueInArray = "FirstValueInArray"
        case conversionType = "ConversionType"
    }
}
