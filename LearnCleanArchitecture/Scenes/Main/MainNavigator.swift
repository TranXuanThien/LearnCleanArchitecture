//
//  MainNavigatortype.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

protocol MainNavigatorType {
    func toProducts()
    func toSectionedProducts()
    func toRepos()
    func toRepoCollection()
}

struct MainNavigator: MainNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProducts() {
        let vc: ProductViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toSectionedProducts() {
//        let vc: SectionedProductsViewController = assembler.resolve(navigationController: navigationController)
//        navigationController.pushViewController(vc, animated: true)
    }
    
    func toRepos() {
//        let vc: ReposViewController = assembler.resolve(navigationController: navigationController)
//        navigationController.pushViewController(vc, animated: true)
    }
    
    func toRepoCollection() {
//        let vc: RepoCollectionViewController = assembler.resolve(navigationController: navigationController)
//        navigationController.pushViewController(vc, animated: true)
    }
}
