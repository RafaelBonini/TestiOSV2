//
//  StringExtensionsSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestiOS2

class StringExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("given a date represented as String") {
            
            context("when converting the string to the expected date format") {
                
                it("then it should return the expected value") {
                    expect("10-01-2010".formattedDate()).to(equal("10/01/2010"))
                    expect("10-11-2010".formattedDate()).to(equal("10/11/2010"))
                    expect("13-04-2020".formattedDate()).to(equal("13/04/2020"))
                    expect("10.01.2010".formattedDate()).to(equal("10/01/2010"))
                }
            }
            
        }
    }
    
}
