//
//  UIViewcontrollerExtensionsSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import TestiOS2

class UIViewcontrollerExtensionsSpec: QuickSpec {
    override func spec() {
        describe("give a view controller") {
            var sut: ShowAlertMock!
            context("when using extension to show an alert") {
                beforeEach {
                    sut = ShowAlertMock()
                    sut.showAlertMessage(message: "")
                }
                
                it("then it should be presenting alert"){
                    expect(sut.didCallShowAlert).to(beTrue())
                }
            }
        }
    }
}

class ShowAlertMock: UIViewController {
    var didCallShowAlert = false
    override func showAlertMessage(title: String = R.string.localizable.commonErrorTitle(), message: String) {
        didCallShowAlert = true
    }
}
