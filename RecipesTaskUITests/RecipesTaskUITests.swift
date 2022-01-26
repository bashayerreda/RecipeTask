//
//  RecipesTaskUITests.swift
//  RecipesTaskUITests
//
//  Created by bashayer reda on 1/26/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import XCTest

class RecipesTaskUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testValidSearchData(){
       let input = "cupcake"
              let searchForRecipeNameSearchField = XCUIApplication().navigationBars["RecipeTask.AllRecipesView"]/*@START_MENU_TOKEN@*/.searchFields["Search for recipe name"]/*[[".staticTexts.searchFields[\"Search for recipe name\"]",".searchFields[\"Search for recipe name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
          XCTAssertTrue(searchForRecipeNameSearchField.exists)
              searchForRecipeNameSearchField.tap()
              searchForRecipeNameSearchField.typeText(input)
            XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
}
    func testWrongArabicInputs(){
        let app = XCUIApplication()
        app.navigationBars["RecipeTask.AllRecipesView"]/*@START_MENU_TOKEN@*/.searchFields["Search for recipe name"]/*[[".staticTexts.searchFields[\"Search for recipe name\"]",".searchFields[\"Search for recipe name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Next keyboard"].tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["ل"]/*[[".keyboards.keys[\"ل\"]",".keys[\"ل\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["ح"]/*[[".keyboards.keys[\"ح\"]",".keys[\"ح\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["م"]/*[[".keyboards.keys[\"م\"]",".keys[\"م\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key3.tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["ه"]/*[[".keyboards.keys[\"ه\"]",".keys[\"ه\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        key4.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"بحث\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["invalid Inputs"].scrollViews.otherElements.buttons["ok"].tap()
      
        
    }
    
    func testWrongCharacters(){
        let wrongInput = "فراخ"
         let searchForRecipeNameSearchField = XCUIApplication().navigationBars["RecipeTask.AllRecipesView"]/*@START_MENU_TOKEN@*/.searchFields["Search for recipe name"]/*[[".staticTexts.searchFields[\"Search for recipe name\"]",".searchFields[\"Search for recipe name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
          XCTAssertTrue(searchForRecipeNameSearchField.exists)
        searchForRecipeNameSearchField.tap()
       searchForRecipeNameSearchField.typeText(wrongInput)
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"بحث\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
        app.alerts["invalid Inputs"].scrollViews.otherElements.buttons["ok"].twoFingerTap()
       
        
    }
    func testInvalidSpaces(){
        let anotherInvalidInput = "  "
                   let searchForRecipeNameSearchField = XCUIApplication().navigationBars["RecipeTask.AllRecipesView"]/*@START_MENU_TOKEN@*/.searchFields["Search for recipe name"]/*[[".staticTexts.searchFields[\"Search for recipe name\"]",".searchFields[\"Search for recipe name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                     XCTAssertTrue(searchForRecipeNameSearchField.exists)
                 searchForRecipeNameSearchField.tap()
                   searchForRecipeNameSearchField.typeText(anotherInvalidInput)

                XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
                XCUIApplication().alerts["invalid Inputs"].scrollViews.otherElements.buttons["ok"].twoFingerTap()
        
        
    }
    /*func testShareButton(){
        
     let app = XCUIApplication()
        app.navigationBars["RecipeTask.DetailsView"].buttons["Share"].tap()
        app/*@START_MENU_TOKEN@*/.navigationBars["UIActivityContentView"]/*[[".otherElements[\"ActivityListView\"].navigationBars[\"UIActivityContentView\"]",".navigationBars[\"UIActivityContentView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Close"].tap()
               
        
}*/
  
    }

 
