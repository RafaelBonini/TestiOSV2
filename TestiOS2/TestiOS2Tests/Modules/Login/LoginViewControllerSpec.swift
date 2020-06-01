//
//  LoginViewControllerSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble
@testable import TestiOS2

class LoginViewControllerSpec: QuickSpec {
    
    override func spec() {
        var sut: LoginViewController!
        var navigationController: UINavigationController!
        var loginRouterMock: LoginRouterMock!
        
        describe("Given a LoginViewController") {
            context("When the view did load") {
                beforeEach {
                    configureSut()
                    sut.viewDidLoad()
                }
                
                it("then it should use the default status bar style") {
                    expect(sut.preferredStatusBarStyle).to(equal(UIStatusBarStyle.default))
                }
                
                it("then it should hide the navigation bar") {
                    expect(navigationController.navigationBar.isHidden).to(beTrue())
                }
            }
            
            context("when routing to statement screen") {
                beforeEach {
                    loginRouterMock = LoginRouterMock()
                    configureSut()
                    sut.router = loginRouterMock
                    let user = UserAccount(userId: nil, name: nil, bankAccount: nil, agency: nil, balance: nil)
                    sut.navigateToStatement(with: user)
                }
                
                it("then it should call router method when action is triggered") {
                    expect(loginRouterMock.didCallNavigateToStatement).to(beTrue())
                }
            }
        }
        
        func configureSut() {
            let viewModel = LoginViewModel()
            sut = LoginViewController(viewModel: viewModel)
            navigationController = UINavigationController(rootViewController: sut)
        }
    }
}

class LoginRouterMock: LoginRouter {
    var didCallNavigateToStatement = false

    override func navigateToStatement(with user: UserAccount) {
        didCallNavigateToStatement = true
    }
}
