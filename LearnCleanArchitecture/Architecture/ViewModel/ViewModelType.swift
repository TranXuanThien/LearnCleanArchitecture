//
//  ViewModelType.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
