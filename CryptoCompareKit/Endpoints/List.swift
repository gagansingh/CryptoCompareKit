//
//  CoinsList.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//
// swiftlint:disable force_unwrapping
extension CryptoCompare {
    public func coinList(success: SuccessResponse<CoinList>?,
                         failure: FailureResponse?) -> Request {
        return request("/all/coinlist", success: success, failure: failure)!
    }
}
