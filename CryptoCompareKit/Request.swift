//
//  Request.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 25/12/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

public class Request {
    private weak var task: URLSessionDataTask?
    
    init(task: URLSessionDataTask) {
        self.task = task
    }
    
    internal func cancel() {
        task?.cancel()
    }
}
