//
//  ResponseStatusSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 27/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble

@testable import TestiOS2

final class ResponseStatusSpec: QuickSpec {
    override func spec() {
        var sut: ResponseStatus!
        
        describe("given ResponseStatus") {
            context("when initializing with status code") {
                it("then it should be success type with status code 200") {
                    sut = ResponseStatus(statusCode: 200)
                    expect(sut).to(equal(.success))
                }
                
                it("then it should be notFound type with status code 404") {
                    sut = ResponseStatus(statusCode: 404)
                    expect(sut).to(equal(.notFound))
                }
                
                it("then it should be unprocessable type with status code 422") {
                    sut = ResponseStatus(statusCode: 422)
                    expect(sut).to(equal(.unprocessable))
                }
                
                it("then it should be conflict type with status code 409") {
                    sut = ResponseStatus(statusCode: 409)
                    expect(sut).to(equal(.conflict))
                }
                
                it("then it should be unauthorized type with status code 401") {
                    sut = ResponseStatus(statusCode: 401)
                    expect(sut).to(equal(.unauthorized))
                }
                
                it("then it should be internalServerError type with status code 500") {
                    sut = ResponseStatus(statusCode: 500)
                    expect(sut).to(equal(.internalServerError))
                }
                
                it("then it should be parseError type with status code 999") {
                    sut = ResponseStatus(statusCode: 999)
                    expect(sut).to(equal(.parseError))
                }
                
                it("then it should be unknown type with status code nil") {
                    sut = ResponseStatus(statusCode: nil)
                    expect(sut).to(equal(.unknown))
                }
                
                it("then it should be unknown type with status code 546") {
                    sut = ResponseStatus(statusCode: 546)
                    expect(sut).to(equal(.unknown))
                }
            }
        }
    }
}

