//
//  CPFEmailValidatorSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Nimble
import Quick

@testable import TestiOS2

class CPFEmailValidatorSpec: QuickSpec {
    override func spec() {
        var sut: CPFEmailValidatorMock!
        
        describe("given CPFEmailValidator") {
            beforeEach {
                sut = CPFEmailValidatorMock()
            }
            context("when testing bool validation"){
                it("then it should be false when nil") {
                    let isValid = sut.validate(cpfEmail: nil)
                    expect(isValid).to(beFalse())
                }
                
                it("then it should be false when empty") {
                    let isValid = sut.validate(cpfEmail: "")
                    expect(isValid).to(beFalse())
                }
                
                it("then it should be false when valid") {
                    let isValid = sut.validate(cpfEmail: "71445255308")
                    expect(isValid).to(beTrue())
                }
            }
        }
    }
}


class CPFEmailValidatorMock: CPFEmailValidator { }
