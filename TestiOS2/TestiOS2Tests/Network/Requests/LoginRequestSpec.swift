//
//  LoginRequestSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble
@testable import TestiOS2

class LoginRequestSpec: QuickSpec {
    override func spec() {
        describe("given a login request") {
            var loginRequest: LoginRequest!
            let user = "user"
            let password = "password"

            context("when using login request") {
                loginRequest = LoginRequest.login(user: user, password: password)
                
                it("then the path should be correct") {
                    let expectedPath = "/login"
                    let expectedBaseUrl = URLs().baseURL
                    expect(loginRequest.path).to(equal(expectedPath))
                    expect(loginRequest.baseURL).to(equal(expectedBaseUrl))
                }
                
                it("then the path should be correct") {
                    let expectedPath = "/login"
                    let expectedBaseUrl = URLs().baseURL
                    expect(loginRequest.path).to(equal(expectedPath))
                    expect(loginRequest.baseURL).to(equal(expectedBaseUrl))
                }
                
                it("then the method should be correct") {
                    let expectedMethod = Method.POST
                    expect(loginRequest.method).to(equal(expectedMethod))
                }
                
                it("then the parameters should be built correctly") {
                    let expectedParams =  [
                        "user": user,
                        "password": password
                    ]
                    expect(loginRequest.params as? [String: String]).to(equal(expectedParams))
                }
            }
        }
    }
}
