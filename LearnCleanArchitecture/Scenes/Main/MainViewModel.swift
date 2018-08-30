//
//  MainViewModel.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import RxCocoa

struct MainViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let menuList: Driver<[MenuModel]>
    }
    
    struct MenuModel {
        let menu: Menu
    }
    
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
    
    func transform(_ input: Input) -> Output {
        let menuList = input.loadTrigger.map {
            Menu.all.map({
                MenuModel(menu: $0)
            })
        }
        return Output(menuList: menuList)
    }
}

extension MainViewModel {
    enum Menu: Int, CustomStringConvertible {
        case products
        case sectionedProducts
        case repos
        case repoCollection
        
        var description: String {
            switch self {
            case .products:
                return "Product list"
            case .sectionedProducts:
                return "Ssectioned product list"
            case .repos:
                return "Git repo list"
            case .repoCollection:
                return "Git repo collection"
            }
        }
        
        static var all: [Menu] = [.products, .sectionedProducts, .repos, .repoCollection]
    }
}
