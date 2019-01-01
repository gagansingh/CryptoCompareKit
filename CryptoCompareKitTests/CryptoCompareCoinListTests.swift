//
//  CryptoCompareCoinListTests.swift
//  CryptoCompareKitTests
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import CryptoCompareKit

class CryptoCompareCoinListTests: XCTestCase {
    
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
        
        CryptoCompare.shared.coinlist { result in
            switch result {
            case let .success(coinList):
                exp.fulfill()
                XCTAssertEqual(coinList.response, "Success")
            case let .failure(error):
                exp.fulfill()
                XCTFail("Error in coin list request: \(error)")
            }
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }

    func testFetchCoinListReturnsFailure () {
        FixtureLoader.stubCoinListReturnFailure()
        let exp = expectation(description: "Received response")
        
        CryptoCompare.shared.coinlist { result in
            switch result {
            case .success(_):
                exp.fulfill()
                XCTFail("Should have returned an error")
            case let .failure(error):
                exp.fulfill()
                if case CryptoCompareError.serverError(let statusCode) = error {
                    XCTAssertEqual(statusCode, 500)
                } else {
                    XCTFail("Expected a server error but got \(error)")
                }
            }
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }

    func testFetchCoinList() {
        let exp = expectation(description: "Received response")
        
        CryptoCompare.shared.coinlist { result in
            switch result {
            case let .success(coinList):
                exp.fulfill()
                XCTAssertGreaterThan(coinList.data.count, 1)
            case let .failure(error):
                exp.fulfill()
                XCTFail("Error in coin list request: \(error)")
            }
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}
