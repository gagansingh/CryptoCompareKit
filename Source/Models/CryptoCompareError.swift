//
//  CryptoCompareError.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Foundation

public enum CryptoCompareError: Error {
    case badRequest
    case decoding(message: String)
    case invalidRequest(message: String)
    case notFound // 404
    case serverError(statusCode: Int) // 5xx
    case requestError // 4xx
}
