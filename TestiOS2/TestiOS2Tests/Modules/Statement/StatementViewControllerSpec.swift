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
        
        describe("Given a StatementViewController") {
            context("When the view did load"){
                beforeEach {
                    statementServiceMock = StatementServiceMock(statementResult: Result.success(StatementMock.invalid()))
                    let viewModel = StatementViewModel(user: LoginModelMock.valid().userAccount!, statementService: statementServiceMock)
                    sut = StatementViewController(viewModel: viewModel)
                    navigationController = UINavigationController(rootViewController: sut)
                    sut.viewDidLoad()
                }
                
                it("then it should use the default status bar style") {
                    expect(sut.preferredStatusBarStyle).to(equal(UIStatusBarStyle.lightContent))
                }
                
                it("then it should hide the navigation bar") {
                    expect(navigationController.navigationBar.isHidden).to(beTrue())
                }
            }
        }
    }
}
