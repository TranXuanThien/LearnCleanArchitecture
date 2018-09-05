//
//  ProductUseCase.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//
import RxSwift

protocol ProductUseCaseType {
    func getProductList() -> Observable<PagingInfo<Product>>
    func loadMoreProductList(page: Int) -> Observable<PagingInfo<Product>>
    func deleteProduct(id: Int) -> Observable<Void>
}

struct ProductUseCase: ProductUseCaseType {
    let productRepository: ProductRepositoryType
    
    func getProductList() -> Observable<PagingInfo<Product>> {
        return loadMoreProductList(page: 1)
    }
    
    func loadMoreProductList(page: Int) -> Observable<PagingInfo<Product>> {
        return productRepository.getProductList(page: page)
    }
    
    func deleteProduct(id: Int) -> Observable<Void> {
        return Observable.just(())
    }
}
