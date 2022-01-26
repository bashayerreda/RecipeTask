//
//  NetworkModelTests.swift
//  RecipeTaskUITests
//
//  Created by bashayer reda on 1/26/22.
//  Copyright © 2022 bashayer reda . All rights reserved.
//

import XCTest
@testable import RecipeTask

//note
//we can use 'mocking' here too as testing data as Local Data
//simulating data here as objects recieved from any api

class NetworkModelTests: XCTestCase {
    var networkModel : NetworkClient!
    override func setUp() {
        networkModel = NetworkClient()
    }
    
    override func tearDown() {
        networkModel = nil
    }
    
    
    func testGetRecipes(){
        let finalResualt = expectation(description: "waiting a little time for Response")
        networkModel.fetchDataUsingSearchWords(keyword: "pizza") { (result, error) in
            if let recipeResult = result {
                finalResualt.fulfill()
            //XCTAssertEqual(recipeResult.hits?.count, 0)  //Test Failed
                XCTAssertEqual(recipeResult.hits?.count, 20) //Test succeeded
                
            }
            else {
                XCTFail()
            }
            
        }
        waitForExpectations(timeout: 10)
    }
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //another function Test
    
    func testGetAnotherRecipes(){
     let finalResualt = expectation(description: "waiting time for Response")
     networkModel.fetchDataUsingSearchWords(keyword: "rice") { (result, error) in
     if let recipeResult = result {
     finalResualt.fulfill()
     XCTAssert(recipeResult.hits?.count == 20)
     
     }
     else {
     XCTFail()
     }
     
     }
     waitForExpectations(timeout: 15)
     }
}
