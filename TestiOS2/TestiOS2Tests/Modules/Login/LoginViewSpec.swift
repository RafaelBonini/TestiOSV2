//
//  LoginViewSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestiOS2

final class LoginViewSpec: QuickSpec {
    override func spec() {
        
        describe("Given a login view") {
            var sut: LoginView!
            var viewModelMock: LoginViewModelMock!
            
            context("When the view is configured") {
                beforeEach {
                    viewModelMock = LoginViewModelMock()
                    sut = LoginView(viewModel: viewModelMock)
                }
                
                it("then it should have triggered loadCredentials from the view") {
                    expect(viewModelMock.didCallLoadCredentials).to(beTrue())
                }
                
                it("then it should be built with the correct data") {
                    expect(sut.logoImageView.image).to(equal(R.image.logo_icon()))
                    
                    expect(sut.userTextField.text).to(equal(viewModelMock.loadCredentials()))
                    
                    expect(sut.userTextField.placeholder).to(equal(R.string.localizable.textfieldUserPlaceholderText()))
                    expect(sut.userTextField.keyboardType).to(equal(.emailAddress))
                    expect(sut.userTextField.returnKeyType).to(equal(.next))
                    
                    expect(sut.passwordTextField.placeholder).to(equal(R.string.localizable.textfieldPasswordPlaceholderText()))
                    expect(sut.passwordTextField.keyboardType).to(equal(.default))
                    expect(sut.passwordTextField.returnKeyType).to(equal(.done))

                    expect(sut.logoImageView.image).to(equal(R.image.logo_icon()))
                }
                
            }
            
            context("when the login action is triggered") {
                beforeEach {
                    sut.loginTapped()
                }
                
                it("should then relay the action to the view model") {
                    expect(viewModelMock.didCallLogin).to(beTrue())
                }
            }
        }
    }
}
