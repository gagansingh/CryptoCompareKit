//
//  Historical.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 05/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

extension CryptoCompare {
    public func histodaily(_ fsym: String,
                           tsym: String,
                           limit: Int,
                           success: SuccessResponse<HistoricalTimeResponse>?,
                           failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsym"] = fsym
        parameters["tsym"] = tsym
        parameters["limit"] = limit
        request("/histoday", parameters: parameters, success: success, failure: failure)
    }
    public func histohourly(_ fsym: String,
                            tsym: String,
                            limit: Int,
                            success: SuccessResponse<HistoricalTimeResponse>?,
                            failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsym"] = fsym
        parameters["tsym"] = tsym
        parameters["limit"] = limit
        request("/histohour", parameters: parameters, success: success, failure: failure)
    }
    public func histominute(_ fsym: String,
                            tsym: String,
                            limit: Int,
                            success: SuccessResponse<HistoricalTimeResponse>?,
                            failure: FailureResponse?) {
        var parameters = Parameters()
        parameters["fsym"] = fsym
        parameters["tsym"] = tsym
        parameters["limit"] = limit
        request("/histominute", parameters: parameters, success: success, failure: failure)
    }
}
