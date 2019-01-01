//
//  CryptoCompareProtocol.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 01/01/2019.
//  Copyright © 2019 Spiros Gerokostas. All rights reserved.
//

import UIKit

public protocol CryptoCompareProtocol {
    func coinlist(completionHandler: (@escaping (Result<CoinList, Error>) -> Void))
        -> CryptoCompareRequest

    func price(_ fsym: String,
               tsyms: String,
               completionHandler: (@escaping (Result<Price, Error>) -> Void))
        -> CryptoCompareRequest?

    func priceMulti(_ fsyms: String,
                    tsyms: String,
                    completionHandler: (@escaping (Result<PriceMulti, Error>) -> Void))
}
