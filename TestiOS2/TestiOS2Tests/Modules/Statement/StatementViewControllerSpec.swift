//
//  StatementViewControllerSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Nimble
import Quick

@testable import TestiOS2

class StatementViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: StatementViewController!
        var navigationController: UINavigationController!
        var statementServiceMock: StatementServiceMock!
        var statementRouterMock: StatementRouterMock!
        
        describe("Given a StatementViewController") {
            context("When the view did load") {
                beforeEach {
                    configureSut()
                    sut.viewDidLoad()
                }
                
                it("then it should use the default status bar style") {
                    expect(sut.preferredStatusBarStyle).to(equal(UIStatusBarStyle.lightContent))
                }
                
                it("then it should hide the navigation bar") {
                    expect(navigationController.navigationBar.isHidden).to(beTrue())
                }
            }
            
            context("when loading the view") {
                beforeEach {
                    configureSut()
                    sut.loadView()
                }
                
                it("then it should have loaded the custom view into the view controller view") {
                    expect(sut.view).to(equal(sut.contentView))
                }
            }
            
            context("when view controller triggers action to pop") {
                beforeEach {
                    statementRouterMock = StatementRouterMock()
                    configureSut()
                    sut.router = statementRouterMock
                    sut.popStatementController()
                }
                
                it("then it should call router method when action is triggered") {
                    expect(statementRouterMock.didCallPopStatementController).to(beTrue())
                }
            }
        }

        func configureSut() {
            statementServiceMock = StatementServiceMock(statementResult: Result.success(StatementMock.invalid()))
            let viewModel = StatementViewModel(user: LoginModelMock.valid().userAccount!, statementService: statementServiceMock)
            sut = StatementViewController(viewModel: viewModel)
            navigationController = UINavigationController(rootViewController: sut)
        }
    }
}

class StatementRouterMock: StatementRouter {
    var didCallPopStatementController = false

    override func popStatementController() {
        didCallPopStatementController = true
    }
}

