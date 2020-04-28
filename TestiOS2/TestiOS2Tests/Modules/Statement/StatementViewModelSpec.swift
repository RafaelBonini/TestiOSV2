//
//  StatementViewModelSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Nimble
import Quick

@testable import TestiOS2

class StatementViewModelSpec: QuickSpec {
    override func spec() {
        describe("given a statementViewModel") {
            var sut: StatementViewModel!
            var viewDelegateMock: StatementViewModelViewDelegateMock!
            var controllerDelegateMock: StatementViewControllerDelegateMock!
            var statementServiceMock: StatementServiceMock!
            var statementFactory: StatementFactory!
            
            
            context("when formatting account number") {
                beforeEach {
                    configureSut()
                }
                
                it("then it should return correctly the formatted valud") {
                    let expectedFormattedValue = "1234 / 12.341234-1"
                    expect(sut.buildAccount()).to(equal(expectedFormattedValue))
                }
            }
            
            context("when logout is triggered") {
                beforeEach {
                    configureSut()
                    sut.logout()
                }
                
                it("then it should tell view controller to pop") {
                    expect(controllerDelegateMock.didCallPopStatementController).to(beTrue())
                }
            }
            
            context("when a error is triggered") {
                beforeEach {
                    configureSut()
                    sut.treatFailure()
                }
                
                it("then it should tell view controller to show an alert") {
                    expect(controllerDelegateMock.didCallShowAlert).to(beTrue())
                }
            }
            
            context("when the factory state is updated with error") {
                beforeEach {
                    configureSut()
                    sut.factoryState = .error
                }
                
                it("then it should tell view controller to show an alert") {
                    expect(controllerDelegateMock.didCallShowAlert).to(beTrue())
                }
                
                it("then it should tell view to stop loading") {
                    expect(viewDelegateMock.didCallStoploading).to(beTrue())
                }
                
                it("then it should tell the view to update the tableview") {
                    expect(viewDelegateMock.didCallReloadTableView).to(beTrue())
                }
            }
            
            context("when the factory state is updated with loading") {
                beforeEach {
                    configureSut()
                    sut.factoryState = .loading
                }
                
                it("then it should tell view to start loading") {
                    expect(viewDelegateMock.didCallStartloading).to(beTrue())
                }
                
                it("then it should tell the view to update the tableview") {
                    expect(viewDelegateMock.didCallReloadTableView).to(beTrue())
                }
            }
            
            context("when the factory state is updated with success") {
                beforeEach {
                    configureSut()
                    sut.factoryState = .success(StatementMock.valid().statementList!)
                }
                
                it("then it should tell view to stop loading") {
                    expect(viewDelegateMock.didCallStoploading).to(beTrue())
                }
                
                it("then it should tell the view to update the tableview") {
                    expect(viewDelegateMock.didCallReloadTableView).to(beTrue())
                }
            }
            
            context("when the service succeeded") {
                beforeEach {
                    configureSut()
                    sut.fetchStatementst()
                }
                
                it("then it should tell view to stop loading") {
                    expect(viewDelegateMock.didCallStoploading).to(beTrue())
                }
                
                it("then it should tell the view to update the tableview") {
                    expect(viewDelegateMock.didCallReloadTableView).to(beTrue())
                }
                
                it("then it should return the correct number of items") {
                    expect(sut.factoryState.statements.count).to(equal(3))
                }
                
                it("then it should build the correct number of sections") {
                    expect(statementFactory.make().count).to(equal(1))
                }
                
                it("then it should build the correct number of sections") {
                    expect(statementFactory.make()[0].numberOfRows).to(equal(3))
                }
            }
            
            context("when the service generates error") {
                beforeEach {
                    configureSut(service: StatementServiceMock(statementResult: Result.success(StatementMock.invalid())))
                    sut.fetchStatementst()
                }
                
                it("then it should tell view to stop loading") {
                    expect(viewDelegateMock.didCallStoploading).to(beTrue())
                }
                
                it("then it should tell the view to update the tableview") {
                    expect(viewDelegateMock.didCallReloadTableView).to(beTrue())
                }
                
                it("then it should tell view controller to show an alert") {
                    expect(controllerDelegateMock.didCallShowAlert).to(beTrue())
                }
            }
            
            func configureSut(service: StatementServiceMock = StatementServiceMock(statementResult: Result.success(StatementMock.valid())),
                              viewDelegate: StatementViewModelViewDelegateMock = StatementViewModelViewDelegateMock(),
                              controllerDelegate: StatementViewControllerDelegateMock = StatementViewControllerDelegateMock(),
                              factory: StatementFactory = StatementFactory(state: StatementFactoryState.success(StatementMock.valid().statementList!))) {
                
                statementServiceMock = service
                viewDelegateMock = viewDelegate
                controllerDelegateMock = controllerDelegate
                statementFactory = factory
                sut = StatementViewModel(user: LoginModelMock.valid().userAccount!, statementService: service)
                sut.viewDelegate = viewDelegateMock
                sut.controllerDelegate = controllerDelegateMock
            }
        }
    }
}


class StatementViewModelViewDelegateMock: StatementViewModelViewDelegate {
    var didCallReloadTableView = false
    var didCallStartloading = false
    var didCallStoploading = false
    
    func reloadTableView() {
        didCallReloadTableView = true
    }
    
    func startloading() {
        didCallStartloading = true
    }
    
    func stoploading() {
        didCallStoploading = true
    }
}

class StatementViewControllerDelegateMock: StatementViewControllerDelegate {
    var didCallShowAlert = false
    var didCallPopStatementController  = false
    
    func showAlert(with message: String) {
        didCallShowAlert = true
    }
    
    func popStatementController() {
        didCallPopStatementController  = true
    }
}

class StatementServiceMock: StatementServiceProtocol {
    
    var network: NetworkCore = NetworkCore()
    
    let statementResult: Result<StatementsModel, BaseNetworkError>
    
    init(statementResult: Result<StatementsModel, BaseNetworkError>) {
        self.statementResult = statementResult
    }
    
    func fetchStatements(with id: Int, completion: @escaping (Result<StatementsModel, BaseNetworkError>) -> Void) {
        completion(statementResult)
    }
}
