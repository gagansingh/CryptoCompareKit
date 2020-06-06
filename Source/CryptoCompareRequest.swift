//
//  CryptoCompareRequest.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 31/12/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Foundation

public final class CryptoCompareRequest: NSObject {
    private weak var task: URLSessionDataTask?

    init(task: URLSessionDataTask) {
        self.task = task
    }

    public func cancel() {
        task?.cancel()
    }
}
