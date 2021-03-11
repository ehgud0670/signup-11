//
//  PasswordPresenterTests.swift
//  SignupAppTests
//
//  Created by kimdo2297 on 2020/07/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
import UIKit
@testable import SignupApp

final class PasswordPresenterTests: XCTestCase {
    func test_validateText_8자_이상_16자_이하로_작성하지_않을_때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "1111"
            return spy
        }()
        let presenter = PasswordPresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "8자 이상 16자 이하로 입력해주세요.")
    }
    
    func test_validateText_영문_대문자를_포함하지_않을_때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "1111jason"
            return spy
        }()
        let presenter = PasswordPresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "영문 대문자를 최소 1자 이상 포함해주세요.")
    }
    
    func test_validateText_숫자가_포함되지_않을_때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "ehgud#Jason"
            return spy
        }()
        let presenter = PasswordPresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "숫자를 최소 1자 이상 포함해주세요.")
    }
    
    func test_validateText_특수문자가_포함되지_않을_때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "ehgud11Jason"
            return spy
        }()
        let presenter = PasswordPresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "특수문자를 최소 1자 이상 포함해주세요.(!@#$%)")
    }
    
    func test_validateText_비밀번호_조건이_맞을_때() throws {
        //given
        let spy: SignupTextableViewSpy = {
            let spy = SignupTextableViewSpy()
            spy.text = "ehgud@11Jason"
            return spy
        }()
        let presenter = PasswordPresenter(signupTextableView: spy)
        
        //when
        presenter.validateText()
        
        //then
        let result = try XCTUnwrap(spy.message)
        XCTAssertEqual(result, "안전한 비밀번호입니다.")
    }
}
