//
//  MenuCellTests.swift
//  LearnCleanArchitectureTests
//
//  Created by tran.xuan.thien on 8/31/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

@testable import LearnCleanArchitecture
import XCTest

class MenuCellTests: XCTestCase {
    
    var cell: MenuCell!
    
    override func setUp() {
        super.setUp()
        cell = MenuCell.loadFromNib()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_iboutlets() {
        XCTAssertNotNil(cell)
        XCTAssertNotNil(cell.titleLabel)
    }
}
