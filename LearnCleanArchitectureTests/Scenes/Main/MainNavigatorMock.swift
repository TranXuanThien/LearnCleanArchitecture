//
//  MainNavigatorMock.swift
//  LearnCleanArchitectureTests
//
//  Created by tran.xuan.thien on 8/31/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

@testable import LearnCleanArchitecture

final class MainNavigatorMock: MainNavigatorType {
    // MARK: - toProducts
    var toProducts_Called = false
    func toProducts() {
        toProducts_Called = true
    }
    
    // MARK: - toSectionedProducts
    var toSectionedProducts_Called = false
    func toSectionedProducts() {
        toSectionedProducts_Called = true
    }
    
    // MARK: - toRepos
    var toRepos_Called = false
    func toRepos() {
        toRepos_Called = true
    }
    
    // MARK: - toRepoCollection
    var toRepoCollection_Called = false
    func toRepoCollection() {
        toRepoCollection_Called = true
    }
}
