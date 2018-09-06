//
//  ProductNavigator.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

protocol ProductNavigatorType {
    func toProductDetail(product: Product)
}

struct ProductNavigator: ProductNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProductDetail(product: Product) {
        
    }
}
