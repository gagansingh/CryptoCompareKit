//
//  Log.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 10/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import os.log

struct Log {
    static var cryptoCompare = OSLog(subsystem: "com.spirosgerokostas.CryptoCompareKit",
                                     category: "CryptoCompare")
}
