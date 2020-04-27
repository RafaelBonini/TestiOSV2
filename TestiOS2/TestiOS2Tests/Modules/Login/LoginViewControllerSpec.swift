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
        
        describe("Given a LoginViewController") {
            context("When the view did load"){
                beforeEach {
                    
                    let viewModel = LoginViewModel()
                    sut = LoginViewController(viewModel: viewModel)
                    navigationController = UINavigationController(rootViewController: sut)
                    sut.viewDidLoad()
                }
                
                it("then it should use the default status bar style") {
                    expect(sut.preferredStatusBarStyle).to(equal(UIStatusBarStyle.default))
                }
                
                it("then it should hide the navigation bar") {
                    expect(navigationController.navigationBar.isHidden).to(beTrue())
                }
            }
        }
    }
}
