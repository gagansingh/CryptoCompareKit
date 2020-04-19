//
//  GeneralInfo.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//
// swiftlint:disable force_unwrapping
extension CryptoCompare {
    @discardableResult
    public func coinlist(completionHandler: (@escaping (Result<Coins, Error>) -> Void))
        -> CryptoCompareRequest? {
            guard let request = request("/all/coinlist", completionHandler: completionHandler) else {
                return nil
            }
            return request
    }
}
