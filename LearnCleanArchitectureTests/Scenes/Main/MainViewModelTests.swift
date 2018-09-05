//
//  MainViewModelTests.swift
//  LearnCleanArchitectureTests
//
//  Created by tran.xuan.thien on 8/31/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

@testable import LearnCleanArchitecture
import XCTest
import RxSwift
import RxBlocking

class MainViewModelTests: XCTestCase {
    
    private var viewModel: MainViewModel!
    private var navigator: MainNavigatorMock!
    private var useCase: MainUseCaseMock!
    private var disposeBag: DisposeBag!
    
    private var input: MainViewModel.Input!
    private var output: MainViewModel.Output!
    private var loadTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        navigator = MainNavigatorMock()
        useCase = MainUseCaseMock()
        viewModel = MainViewModel(navigator: navigator, useCase: useCase)
        disposeBag = DisposeBag()
        
        input = MainViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete())
        output = viewModel.transform(input)
        output.menuList.drive().disposed(by: disposeBag)
    }
    
    func test_loadTriggerInvoked_loadMenuList() {
        loadTrigger.onNext(())
        let menuList = try? output.menuList.toBlocking(timeout: 1).first()

        XCTAssertEqual(menuList??.count, MainViewModel.Menu.all.count)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
