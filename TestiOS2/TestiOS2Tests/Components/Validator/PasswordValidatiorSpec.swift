//
//  PasswordValidatiorSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Nimble
import Quick

@testable import TestiOS2

class PasswordValidatiorSpec: QuickSpec {
    override func spec() {
        var sut: PasswordValidatiorMock!
        
        describe("given CPFEmailValidator") {
            beforeEach {
                sut = PasswordValidatiorMock()
            }
            context("when testing bool validation"){
                it("then it should be false when nil") {
                    let isValid = sut.validate(password: nil)
                    expect(isValid).to(beFalse())
                }
                
                it("then it should be false when empty") {
                    let isValid = sut.validate(password: "")
                    expect(isValid).to(beFalse())
                }
                
                it("then it should be false when not valid") {
                    let isValid = sut.validate(password: "12341")
                    expect(isValid).to(beFalse())
                }
                
                it("then it should be true when valid") {
                    let isValid = sut.validate(password: "Asd123@!3")
                    expect(isValid).to(beTrue())
                }
            }
        }
    }
}


class PasswordValidatiorMock: PasswordValidatior { }
