//
//  ResultSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble

@testable import TestiOS2

final class ResultSpec: QuickSpec {
    override func spec() {
        var sut: Result<String, NetworkErrorMock>!
        let valueMock = "value"
        let errorMock = NetworkErrorMock(responseStatus: .notFound, error: nil, data: nil)
        
        
        describe("given Result") {
            context("when success type") {
                beforeEach {
                    sut = .success(valueMock)
                }
                
                it("then isSuccess should be true") {
                    expect(sut.isSuccess).to(beTrue())
                }
                
                it("then isfailure should be false") {
                    expect(sut.isFailure).to(beFalse())
                }
                
                it("then value should be equal passed value") {
                    expect(sut.value).to(equal(valueMock))
                }
                
                it("then error should be nil") {
                    expect(sut.error).to(beNil())
                }
            }
            
            context("when failure type") {
                beforeEach {
                    sut = .failure(errorMock)
                }
                
                it("then isSuccess should be false") {
                    expect(sut.isSuccess).to(beFalse())
                }
                
                it("then isfailure should be true") {
                    expect(sut.isFailure).to(beTrue())
                }
                
                it("then value should be nil") {
                    expect(sut.value).to(beNil())
                }
                
                it("then error responseStatus should be equal passed error responseStatus") {
                    expect(sut.error?.responseStatus).to(equal(errorMock.responseStatus))
                }
            }
        }
    }
}
