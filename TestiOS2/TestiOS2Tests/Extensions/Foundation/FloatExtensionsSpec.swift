//
//  FloatExtensionsSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestiOS2

class FloatExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("given a amount represented as float") {
            let a: Float = 100.10
            let b: Float = 1000.19
            let c: Float = 2342.342
            let d: Float = 3453.129144
            
            context("when formatting the amount to a currency") {
                
                it("then it should have the expected result") {
                    expect(a.currencyFormatter()).to(equal("R$ 100,10"))
                    expect(b.currencyFormatter()).to(equal("R$ 1.000,19"))
                    expect(c.currencyFormatter()).to(equal("R$ 2.342,34"))
                    expect(d.currencyFormatter()).to(equal("R$ 3.453,13"))
                }
            }
            
        }
    }
}
