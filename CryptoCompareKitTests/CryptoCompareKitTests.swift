//
//  CryptoCompareKitTests.swift
//  CryptoCompareKitTests
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import CryptoCompareKit

class CryptoCompareKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        OHHTTPStubs.onStubMissing { request in
            XCTFail("Missing stub for \(request)")
        }
        
        FixtureLoader.stubCoinListResponse()
    }

    override func tearDown() {
        super.tearDown()
        FixtureLoader.reset()
    }
    
    func testFetchCoinListResponse() {
        let exp = expectation(description: "Received response")
        CryptoCompare.shared.coinList(success: { coinList in
            exp.fulfill()
            XCTAssertEqual(coinList.response, "Success")
        }) { error in
            exp.fulfill()
            XCTFail("Error in coin list request: \(error)")
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testFetchCoinListReturnsFailure () {
        FixtureLoader.stubCoinListReturnFailure()
        let exp = expectation(description: "Received response")
        CryptoCompare.shared.coinList(success: { coinList in
            exp.fulfill()
            XCTFail("Should have returned an error")
        }) { error in
            exp.fulfill()
            if case CryptoCompareError.serverError(let statusCode) = error {
                XCTAssertEqual(statusCode, 500)
            } else {
                XCTFail("Expected a server error but got \(error)")
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}
