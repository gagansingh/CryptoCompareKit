//
//  CoinsList.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

extension CryptoCompare {
    public func coinList(success: SuccessResponse<[String: TestCoin]>?, failure: FailureResponse?) {
        print("coinList")
        request("/data/all/coinlist", success: success, failure: failure)
    }
}
