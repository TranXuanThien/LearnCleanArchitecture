//
//  Assembler.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/7/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

protocol Assembler: class, AppAssembler, MainAssembler, ProductAssembler, RepositoriesAssembler
{
    
}

class DefaultAssembler: Assembler {
    
}
