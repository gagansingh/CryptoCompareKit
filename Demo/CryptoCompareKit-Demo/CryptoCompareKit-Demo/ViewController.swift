//
//  ViewController.swift
//  CryptoCompareKit-Demo
//
//  Created by Spiros Gerokostas on 06/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Foundation
import CryptoCompareKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cryptoCompare = CryptoCompare()
      
        cryptoCompare.coinlist { result in
            switch result {
            case let .success(coinList):
                print(coinList)
            case let .failure(error):
                print(error)
            }
        }
    }
}
