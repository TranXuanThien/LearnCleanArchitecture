//
//  AppAssembler.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

protocol AppAssembler {
    func resolve(window: UIWindow) -> AppViewModel
    func resolve(window: UIWindow) -> AppNavigatorType
    func resolve() -> AppUseCaseType
}

extension AppAssembler {
    func resolve(window: UIWindow) -> AppViewModel {
        return AppViewModel(navigator: resolve(window: window), useCase: resolve())
    }
}

extension AppAssembler where Self: DefaultAssembler {
    func resolve(window: UIWindow) -> AppNavigatorType {
        return AppNavigator(assembler: self, window: window)
    }
    
    func resolve() -> AppUseCaseType {
        return AppUseCase()
    }
}
