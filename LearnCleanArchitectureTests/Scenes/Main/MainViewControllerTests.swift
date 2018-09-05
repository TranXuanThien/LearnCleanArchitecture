//
//  MainViewControllerTests.swift
//  LearnCleanArchitectureTests
//
//  Created by tran.xuan.thien on 8/31/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//
@testable import LearnCleanArchitecture
import XCTest
import Reusable

class MainViewControllerTests: XCTestCase {

    var viewController: MainViewController!
    
    override func setUp() {
        super.setUp()
        viewController = MainViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
