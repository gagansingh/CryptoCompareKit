//
//  FixtureLoader.swift
//  CryptoCompareKitTests
//
//  Created by Spiros Gerokostas on 10/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit
import OHHTTPStubs

class FixtureLoader {
    static func reset() {
        OHHTTPStubs.removeAllStubs()
    }
    static func stubCoinListResponse() {
        stub(condition: isHost("min-api.cryptocompare.com") && isPath("/data/all/coinlist")) { response -> OHHTTPStubsResponse in
            return jsonFixture(with: "coinList.json")
        }
    }
    private static func jsonFixture(with filename: String) -> OHHTTPStubsResponse {
        let bundle = OHResourceBundle("Fixtures", FixtureLoader.self)!
        let path = OHPathForFileInBundle(filename, bundle)!
        return OHHTTPStubsResponse(fileAtPath: path, statusCode: 200, headers: nil)
    }
}
