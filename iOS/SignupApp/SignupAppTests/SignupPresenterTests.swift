//
//  SignupAppTests.swift
//  SignupAppTests
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
import UIKit
@testable import SignupApp

final class SignupPresenterTests: XCTestCase {
    private var presenter: SignupPresenter!
    private var textableView: SignupTextableViewSpy!
    
    override func setUp() {
        textableView = SignupTextableViewSpy()
        textableView.text = ""
        presenter = SignupPresenter(signupTextableView: textableView)
    }

    override func tearDown() {
        presenter = nil
        textableView = nil
    }
    
    func test_validateText_텍스트_길이가_0일때() throws {
        //when
        presenter.validateText()
        //then
        let result = try XCTUnwrap(textableView.message)
        XCTAssertEqual(result, "필수 항목입니다.")
    }
}
