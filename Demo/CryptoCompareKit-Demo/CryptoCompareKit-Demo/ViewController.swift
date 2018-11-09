//
//  ViewController.swift
//  CryptoCompareKit-Demo
//
//  Created by Spiros Gerokostas on 06/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit
import CryptoCompareKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        CryptoCompare.shared.coinList(success: { coinList in
//            print(coinList)
//        }) { error in
//            print(error)
//        }
        CryptoCompare.shared.histominute("BTC", tsym: "USD", limit: 10, success: { response in
            print(response)
        }) { error in
            print(error)
        }
    }
}
