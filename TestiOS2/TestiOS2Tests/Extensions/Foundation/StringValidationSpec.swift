//
//  StringValidationSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestiOS2

class StringValidationSpec: QuickSpec {
    
    override func spec() {
        describe("given a string to be validated") {
            
            context("when checking if a password is valid") {
                
                it("then it should be valid") {
                    expect("Aa123@".validatePasswordRegex()).to(beTrue())
                    expect("Aad123@".validatePasswordRegex()).to(beTrue())
                    expect("AAasd@@!23".validatePasswordRegex()).to(beTrue())
                    expect("@@asdA123".validatePasswordRegex()).to(beTrue())
                }
                
                it("then it should not be valid") {
                    expect("1234".validatePasswordRegex()).to(beFalse())
                    expect("AasdaA@".validatePasswordRegex()).to(beFalse())
                    expect("#@$#$@#$".validatePasswordRegex()).to(beFalse())
                    expect("Aas123".validatePasswordRegex()).to(beFalse())
                }
            }
            
            context("when checking if a email is valid") {
                
                it("then it should be valid") {
                    expect("asd@asd.com".validateEmailRegex()).to(beTrue())
                    expect("aasdsd@aasdsd.com".validateEmailRegex()).to(beTrue())
                    expect("aas234@a234dsd.de".validateEmailRegex()).to(beTrue())
                }
                
                it("then it should not be valid") {
                    expect("a@a.com".validateEmailRegex()).to(beFalse())
                    expect("asd@asd".validateEmailRegex()).to(beFalse())
                    expect("aasdsd.aasdsd.com".validateEmailRegex()).to(beFalse())
                }
            }
            
            context("when checking if a cpf is valid") {
                
                it("then it should be valid") {
                    expect("39561101025".validateCpf()).to(beTrue())
                    expect("48090411070".validateCpf()).to(beTrue())
                    expect("29736127052".validateCpf()).to(beTrue())
                    expect("98850650086".validateCpf()).to(beTrue())
                }
                
                it("then it should not be valid") {
                    expect("395361101025".validateCpf()).to(beFalse())
                    expect("49990411070".validateCpf()).to(beFalse())
                    expect("29736122".validateCpf()).to(beFalse())
                    expect("98850650023".validateCpf()).to(beFalse())
                }
            }
        }
    }
    
}
