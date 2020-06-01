//
//  RequestMethodSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble
import Alamofire
@testable import TestiOS2

class RequestMethodSpec: QuickSpec {
    override func spec() {
        var sut: RequestMethod!
        
        describe("give a RequestMethod enum") {
            context("when RequestMethod is of type get") {
                beforeEach {
                    sut = RequestMethod.GET
                }
                
                it("then it should return the corresponding http method") {
                    expect(sut.asHTTPMethod()).to(equal(HTTPMethod.get))
                }
            }
            
            context("when RequestMethod is of type post") {
                beforeEach {
                    sut = RequestMethod.POST
                }
                
                it("then it should return the corresponding http method") {
                    expect(sut.asHTTPMethod()).to(equal(HTTPMethod.post))
                }
            }
        }
    }
}
