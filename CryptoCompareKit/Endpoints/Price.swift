//
//  Price.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

extension CryptoCompare {
    
    // MARK: Price Endpoints
    
    public typealias Price = [String: Double]
    public typealias PriceMulti = [String: [String: Double]]
    
    /// Get the current price of any cryptocurrency in any other currency that you need.
    ///
    /// - Parameter fsym: The cryptocurrency symbol of interest [Max character length: 10].
    /// - Parameter tsyms: Comma separated cryptocurrency symbols list to convert into [Max character length: 500].
    /// - Parameter success: The callback called after a successful response.
    /// - Parameter failure: The callback called after an incorect response.
    @discardableResult
    public func price(_ fsym: String,
                      tsyms: String,
                      success: SuccessResponse<Price>?,
                      failure: FailureResponse?) -> Request? {
        var parameters = Parameters()
        parameters["fsym"] = fsym
        parameters["tsyms"] = tsyms
        if let request = request("/price",
                                 parameters: parameters,
                                 success: success,
                                 failure: failure) {
            return request
        }
        return nil
    }
    
    /// Same as single API path but with multiple from symbols.
    ///
    /// - Parameter fsyms: Comma separated cryptocurrency symbols list [Max character length: 300].
    /// - Parameter tsyms: Comma separated cryptocurrency symbols list to convert into [Max character length: 100]
    /// - Parameter success: The callback called after a successful response.
    /// - Parameter failure: The callback called after an incorect response.
    public func priceMulti(_ fsyms: String,
                           tsyms: String,
                           success: SuccessResponse<PriceMulti>?,
                           failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsyms"] = fsyms
        parameters["tsyms"] = tsyms
        request("/pricemulti", parameters: parameters, success: success, failure: failure)
    }
    
    /// Get all the current trading info (price, vol, open, high, low etc) of any list of cryptocurrencies in any other currency that you need.
    ///
    /// - Parameter fsyms: Comma separated cryptocurrency symbols list [Max character length: 300].
    /// - Parameter tsyms: Comma separated cryptocurrency symbols list to convert into [Max character length: 100]
    /// - Parameter success: The callback called after a successful response.
    /// - Parameter failure: The callback called after an incorect response.
    public func priceMultiFull(_ fsyms: String,
                               tsyms: String,
                               success: SuccessResponse<PriceMultiFull>?,
                               failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsyms"] = fsyms
        parameters["tsyms"] = tsyms
        request("/pricemultifull", parameters: parameters, success: success, failure: failure)
    }
    
    /// Compute the current trading info (price, vol, open, high, low etc) of the requested pair as a volume weighted average based on the exchanges requested.
    ///
    /// - Parameter fsym: The cryptocurrency symbol of interest [Max character length: 10].
    /// - Parameter fsym: The currency symbol to convert into [Max character length: 10].
    /// - Parameter e: The exchange to obtain data from (our aggregated average - CCCAGG - by default) [Max character length: 150].
    /// - Parameter success: The callback called after a successful response.
    /// - Parameter failure: The callback called after an incorect response.
    public func priceGenerateAverage(_ fsym: String,
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
