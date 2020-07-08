//
//  loginValidatorTests.swift
//  loginValidatorTests
//
//  Created by 12dot on 02.07.2020.
//  Copyright © 2020 12dot. All rights reserved.
//

import XCTest
@testable import loginValidator

class loginValidatorTests: XCTestCase {
    
    let loginValidator = LoginValidator()
    
    func testMinLengthFail(){
        XCTAssert(loginValidator.isLoginValid(login: "qw") == false)
    }
    
    func testMinLengthSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "qwe") == true)
    }
    
    func testEmptyFail(){
        XCTAssert(loginValidator.isLoginValid(login: "") == false)
    }
    
    func testSpacesFail(){
        XCTAssert(loginValidator.isLoginValid(login: "   ") == false)
    }
    
    func testMaxLengthLettersFail(){
        XCTAssert(loginValidator.isLoginValid(login: "qwertyqwertyqwertyqwertyqwertyqwe") == false)
    }
    
    func testMaxLengthLettersSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "qwertyqwertyqwertyqwertyqwertyqw") == true)
    }
    
    func testMaxLengthUpLetterFail(){
           XCTAssert(loginValidator.isLoginValid(login: "qQWERTYQWERTYQWERTYQWERTYQWERTYQW") == false)
    }
    
    func testMaxLengthUpLetterSuc(){
           XCTAssert(loginValidator.isLoginValid(login: "qQWERTYQWERTYQWERTYQWERTYQWERTYQ") == true)
    }
    
    func testMaxLengthMinusFail(){
        XCTAssert(loginValidator.isLoginValid(login: "q--------------------------------") == false)
    }
    
    func testMaxLengthMinusSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "q-------------------------------") == true)
    }
    
    func testMaxLengthDotFail(){
        XCTAssert(loginValidator.isLoginValid(login: "q................................") == false)
    }
    
    func testMaxLengthDotSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "q...............................") == true)
    }
    
    func testMaxLengthDigitFail(){
        XCTAssert(loginValidator.isLoginValid(login: "q12345123451234512345123451234512") == false)
    }
    
    func testMaxLengthDigitSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "q1234512345123451234512345123451") == true)
    }
    
    func testFirstSymbolLowLetterSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "qwe") == true)
    }
    
    func testFirstSymbolUpLetterSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "QWE") == true)
    }
    
    func testFirstSymbolMinusFail(){
        XCTAssert(loginValidator.isLoginValid(login: "-WE") == false)
    }

    func testFirstSymbolDotFail(){
        XCTAssert(loginValidator.isLoginValid(login: ".WE") == false)
    }
    
    func testFirstSymbolRandomFail(){
        XCTAssert(loginValidator.isLoginValid(login: "@WE") == false)
    }
    
    func testAllAllowedSymbolsIncludedSuc(){
        XCTAssert(loginValidator.isLoginValid(login: "qW1.-qW1.-qW1.-qW1.-") ==  true)
    }
    
    func testNotAllowedSymbolIncludedFail(){
        XCTAssert(loginValidator.isLoginValid(login: "qW1.-qW1.-qW1@.-qW1.-") ==  false)
    }
    
}
