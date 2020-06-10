//
//  Stock.swift
//  StocksApp
//
//  Created by Wanhar on 10/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct Stock : Decodable {
    
    let symbol      : String
    let description : String
    let price       : Double
    let change      : String
}
