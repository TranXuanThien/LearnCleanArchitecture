//
//  Product.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/7/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import Foundation

struct Product {
    var id: Int
    var name: String
    var price: Double
}

extension Product {
    init() {
        self.init(id: 0, name: "", price: 0.0)
    }
}

//extension Product: Then, HasID, Hashable { }
