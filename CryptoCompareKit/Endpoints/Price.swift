//
//  Price.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

extension CryptoCompare {
    public typealias Price = [String: Double]
    public typealias PriceMulti = [String: [String: Double]]
    public func price(_ fsym: String,
                      tsyms: String,
                      success: SuccessResponse<Price>?,
                      failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsym"] = fsym
        parameters["tsyms"] = tsyms
        request("/price", parameters: parameters, success: success, failure: failure)
    }
    public func priceMulti(_ fsyms: String,
                      tsyms: String,
                      success: SuccessResponse<PriceMulti>?,
                      failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsyms"] = fsyms
        parameters["tsyms"] = tsyms
        request("/pricemulti", parameters: parameters, success: success, failure: failure)
    }
    public func priceMultiFull(_ fsyms: String,
                           tsyms: String,
                           success: SuccessResponse<PriceMultiFull>?,
                           failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsyms"] = fsyms
        parameters["tsyms"] = tsyms
        request("/pricemultifull", parameters: parameters, success: success, failure: failure)
    }
    public func priceGenerateAverage(fsym: String,
                               tsym: String,
                               e: String,
                               success: SuccessResponse<PriceGenerateAverage>?,
                               failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsym"] = fsym
        parameters["tsym"] = tsym
        parameters["e"] = e
        request("/generateAvg", parameters: parameters, success: success, failure: failure)
    }
}
