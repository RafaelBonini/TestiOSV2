//
//  StatementRequestSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble
@testable import TestiOS2

class StatementRequestSpec: QuickSpec {
    override func spec() {
        var statementRequest: StatementRequest!
        let id = 1
        describe("given a statement request") {
            context("when using a statement request") {
                beforeEach {
                    statementRequest = StatementRequest.fetchStatements(with: id)
                }
                
                it("then it should build the path correctly") {
                    let expectedPath = "/statements/\(id)"
                    let expectedBaseUrl = URLs().baseURL
                    expect(statementRequest.path).to(equal(expectedPath))
                    expect(statementRequest.baseURL).to(equal(expectedBaseUrl))
                }
                
                it("then it should use the correct method") {
                    let expectedMethod = RequestMethod.GET
                    expect(statementRequest.method).to(equal(expectedMethod))
                }
                
                it("then it should have no parameters") {
                    expect(statementRequest.params).to(beNil())
                }
            }
        }
    }
}
