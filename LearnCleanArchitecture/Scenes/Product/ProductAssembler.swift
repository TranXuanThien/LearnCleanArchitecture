//
//  ProductAssembler.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

protocol ProductAssembler {
    func resolve(navigationController: UINavigationController) -> ProductViewController
    func resolve(navigationController: UINavigationController) -> ProductViewModel
    func resolve(navigationController: UINavigationController) -> ProductNavigatorType
    func resolve() -> ProductUseCaseType
}

extension ProductAssembler {
    func resolve(navigationController: UINavigationController) -> ProductViewController {
        let vc = ProductViewController.instantiate()
        let vm: ProductViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> ProductViewModel {
        return ProductViewModel(navigator: resolve(navigationController: navigationController), useCase: resolve()
        )
    }
}

extension ProductAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> ProductNavigatorType {
        return ProductNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> ProductUseCaseType {
        return ProductUseCase(productRepository: resolve())
    }
}
