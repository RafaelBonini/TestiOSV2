//
//  StatementServiceSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble

@testable import TestiOS2

final class StatementServiceSpec: QuickSpec {
    override func spec() {
        var sut: StatementService!
        var networkCoreMock: NetworkCoreMock!
        var dataMock: Data!
        
        describe("Given statement service") {
            context("when requests succeed") {
                beforeEach {
                    dataMock = StatementMock.asData()
                    networkCoreMock = NetworkCoreMock(result: .success(data: dataMock))
                    sut = StatementService(network: networkCoreMock)
                }
                it("then it should be successfull") {
                    sut.fetchStatements(with: 1) { (result:Result<StatementsModel, BaseNetworkError>) in
                        expect(result).to(beASuccessCase())
                    }
                }   
            }
            
            context("when requests fails") {
                beforeEach {
                    dataMock = StatementMock.asData()
                    networkCoreMock = NetworkCoreMock(result: .failure)
                    sut = StatementService(network: networkCoreMock)
                }
                it("then it should fail") {
                    sut.fetchStatements(with: 1) { (result:Result<StatementsModel, BaseNetworkError>) in
                        expect(result).to(beAFailureCase())
                    }
                }
            }
        }
    }
}

