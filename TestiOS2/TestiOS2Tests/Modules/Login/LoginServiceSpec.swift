//
//  LoginServiceSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 27/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble

@testable import TestiOS2

final class LoginServiceSpec: QuickSpec {
    override func spec() {
        var sut: LoginService!
        var networkCoreMock: NetworkCoreMock!
        var dataMock: Data!
        
        describe("Given login service") {
            context("when requests succeed") {
                beforeEach {
                    dataMock = LoginModelMock.asData()
                    networkCoreMock = NetworkCoreMock(result: .success(data: dataMock))
                    sut = LoginService(network: networkCoreMock)
                }
                it("then it should be successfull") {
                    sut.fetchUser(user: "", password: "") { (result: Result<LoginModel, BaseNetworkError>) in
                        expect(result).to(beASuccessCase())
                    }
                } 
                
            }
            
            context("when requests fails") {
                beforeEach {
                    dataMock = LoginModelMock.asData()
                    networkCoreMock = NetworkCoreMock(result: .failure)
                    sut = LoginService(network: networkCoreMock)
                }
                it("then it should fail") {
                    sut.fetchUser(user: "", password: "") { (result: Result<LoginModel, BaseNetworkError>) in
                        expect(result).to(beAFailureCase())
                    }
                }
            }
        }
    }
}
