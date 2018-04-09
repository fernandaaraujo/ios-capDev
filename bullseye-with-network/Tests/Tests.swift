//
//  Tests.swift
//  Tests
//
//  Created by Fernanda Araújo on 09/04/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import XCTest

@testable import BullsEye

class Tests: XCTestCase {
  
  var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        viewController.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
    func testStartNewGame() {
        viewController.startNewGame()
      
        XCTAssertEqual(viewController.score, 0)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
