//
//  ProductViewModel.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import Foundation

struct ProductViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let reloadTrigger: Driver<Void>
        let loadMoreTrigger: Driver<Void>
        let selectProductTrigger: Driver<IndexPath>
        let editProductTrigger: Driver<IndexPath>
        let deleteProductTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let error: Driver<Error>
        let loading: Driver<Bool>
        let refreshing: Driver<Bool>
        let loadingMore: Driver<Bool>
        let fetchItems: Driver<Void>
        let productList: Driver<[ProductModel]>
//        let selectedProduct: Driver<Void>
//        let editedProduct: Driver<Void>
        let isEmptyData: Driver<Bool>
//        let deletedProduct: Driver<Void>
    }
    
    struct ProductModel {
        let product: Product
    }
    
    let navigator: ProductNavigatorType
    let useCase: ProductUseCaseType
    
    func transform(_ input: ProductViewModel.Input) -> ProductViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let loadMoreOutput = setupLoadMorePaging(loadTrigger: input.loadTrigger,
                                                 getItems: useCase.getProductList,
                                                 refreshTrigger: input.reloadTrigger,
                                                 refreshItems: useCase.getProductList,
                                                 loadMoreTrigger: input.loadMoreTrigger,
                                                 loadMoreItems: useCase.loadMoreProductList)
        let (page, fetchItems, loadError, loading, refreshing, loadingMore) = loadMoreOutput
        
        let productList = page.map({ $0.items.map({ ProductModel(product: $0)})}).asDriverOnErrorJustComplete()
        let isEmptyData = Driver.combineLatest(productList, loading).filter({ !$0.1 }).map({ $0.0.isEmpty })
        return Output(
            error: loadError,
            loading: loading,
            refreshing: refreshing,
            loadingMore: loadingMore,
            fetchItems: fetchItems,
            productList: productList,
            isEmptyData: isEmptyData)
    }
}
