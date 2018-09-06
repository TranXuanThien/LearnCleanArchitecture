//
//  RepositoriesAssembler.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/6/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

protocol RepositoriesAssembler {
//    func resolve() -> RepoRepositoryType
    func resolve() -> ProductRepositoryType
}

extension RepositoriesAssembler where Self: DefaultAssembler {
//    func resolve() -> RepoRepositoryType {
//        return RepoRepository()
//    }
    
    func resolve() -> ProductRepositoryType {
        return ProductRepository()
    }
}
