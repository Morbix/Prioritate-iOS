//
//  PrioritateTests.swift
//  PrioritateTests
//
//  Created by Henrique Morbin on 02/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit
import XCTest

class PrioritateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func xtestExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func xtestPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreatingItemDescription (){
        var item: PFItem = PFItem(name: "Test A")
        
        let expected: String = "Test A (0.00%)"
        
        XCTAssert(expected == item.description, "Item \(item.description) deveria ter a descrição: \(expected)")
    }
    
    func testCreatingItemDislayName (){
        var item: PFItem = PFItem(name: "Test A")
        
        let expected: String = "Test A"
        
        XCTAssert(expected == item.getDisplayName(), "Item \(item.description) deveria ter o displayName: \(expected)")
    }
    
}
