//
//  NamePresenterTests.swift
//  SignupAppTests
//
//  Created by kimdo2297 on 2020/07/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
import UIKit
@testable import SignupApp

final class NamePresenterTests: XCTestCase {
    func test_validateText_이름에_공백이_있을때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "김 도형"
            return spy
        }()
        let presenter = NamePresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "공백이 포함되면 안됩니다.")
    }
    
    func test_validateText_이름이_조건이_맞을때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "김도형"
            return spy
        }()
        let presenter = NamePresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "사용가능한 이름입니다.")
    }
}
