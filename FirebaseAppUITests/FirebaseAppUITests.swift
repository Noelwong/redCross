//
//  FirebaseAppUITests.swift
//  FirebaseAppUITests
//
//  Created by Wong Hok Lam on 11/4/2018.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import XCTest

class FirebaseAppUITests: XCTestCase {
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's
        // usually a good idea to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")
        
        
    }
    
    // MARK: - Tests
    
    func testPreLoginPageButton() {
        app.launch()
        
      
        app.buttons["login-btn"].tap()
        app.buttons["back"].tap()
        app.buttons["sign-up-btn"].tap()
        
        
        // Onboarding should no longer be displayed
//        XCTAssertFalse(app.isDisplayingOnboarding)
    }
}

    

