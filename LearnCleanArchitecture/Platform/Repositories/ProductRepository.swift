//
//  ProductRepository.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit
import RxSwift

protocol ProductRepositoryType {
    func getProductList(page: Int) -> Observable<PagingInfo<Product>>
    func deleteProduct(id: Int) -> Observable<Void>
    func update(_ product: Product) -> Observable<Void>
}

final class ProductRepository: ProductRepositoryType {
    func getProductList(page: Int) -> Observable<PagingInfo<Product>> {
        return Observable.create { observer in
            let products = Array(0...9)
                .map { $0 + (page - 1) * 10 }
                .map { id in
                    Product().with {
                        $0.id = id
                        $0.name = "Product \(id)"
                        $0.price = Double(id * 2)
                    }
            }
            let page = PagingInfo<Product>(page: page, items: OrderedSet<Product>(sequence: products))
            observer.onNext(page)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    func deleteProduct(id: Int) -> Observable<Void> {
        return Observable.just(())
    }
    
    func update(_ product: Product) -> Observable<Void> {
        return Observable.just(())
    }}
