//
//  IDPresenterTests.swift
//  SignupAppTests
//
//  Created by kimdo2297 on 2020/07/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
import UIKit
@testable import SignupApp

private final class IDableViewSpy: UIView, IDableView {
    var isRequiredOverlapValidation: Bool = false
    var isCorrect: Bool = false
    var text: String? = nil
    var message: String? = nil
    
    func setWrongCase(message: String) {
        self.message = message
    }
    
    func setCorrectCase(message: String) {
        self.message = message
    }
}

final class IDPresenterTests: XCTestCase {
    func test_validateText_아이디_조건이_맞지_않을_때() throws {
        //given
        let spy: IDableViewSpy = {
            let spy = IDableViewSpy()
            spy.text = "김도형"
            return spy
        }()
        let presenter = IDPresenter(idableView: spy)
        
        //when
        _ = presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다.")
    }
    
    func test_validateText_아이디_조건이_맞지만_아이디_중복_검사를_하지않을_때() throws {
        //given
        let spy: IDableViewSpy = {
            let spy = IDableViewSpy()
            spy.text = "kimdo2297"
            return spy
        }()
        let presenter = IDPresenter(idableView: spy)
        
        //when
        _ = presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "사용 가능하지만 아이디 중복 검사를 진행하셔야 합니다.")
    }
}
