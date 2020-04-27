//
//  LoginViewModelSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble
@testable import TestiOS2

class LoginViewModelSpec: QuickSpec {
    override func spec() {
        describe("Given a LoginViewModel") {
            var sut: LoginViewModel!
            var viewDelegateMock: LoginViewModelViewDelegateMock!
            var controllerDelegateMock: LoginViewControllerDelegateMock!
            var loginServiceMock: LoginServiceMock!
            var storageMock: StorageMock!
            
            context("When trying to log in with invalid credentials") {
                beforeEach {
                    configureSut()
                    sut.login(cpfOrEmail: "", password: "")
                }
                
                it("Then should show a alert") {
                    expect(controllerDelegateMock.didCallShowAlert).to(beTrue())
                }
                
                it("Then should show not navigate to statement screen") {
                    expect(controllerDelegateMock.didCallnavigateToStatement).to(beFalse())
                }
                
                it("Then should show not save user credentials") {
                    expect(storageMock.didCallSet).to(beFalse())
                }
                
            }
            
            context("When trying to log in with valid credentials") {
                beforeEach {
                    configureSut()
                    sut.login(cpfOrEmail: "asd@asd.com", password: "Aa124@@")
                }
                
                it("then it should navigate to statement screen") {
                    expect(controllerDelegateMock.didCallnavigateToStatement).to(beTrue())
                }
                
                it("then it should not show an alert") {
                    expect(controllerDelegateMock.didCallShowAlert).to(beFalse())
                }
                
                it("Then should show save user credentials") {
                    expect(storageMock.didCallSet).to(beTrue())
                }
            }

            context("When the service fails") {
                beforeEach {
                    configureSut(service: LoginServiceMock(loginResult: Result.failure(BaseNetworkError(responseStatus: .unknown))))
                    sut.login(cpfOrEmail: "asd@asd.com", password: "Aa124@@")
                }
                
                it("Then should display an alert") {
                    expect(controllerDelegateMock.didCallShowAlert).to(beTrue())
                }
                
                it("then should have changed the status to loading and stoped after the service") {
                    expect(viewDelegateMock.didCallStartLoading).to(beTrue())
                    expect(viewDelegateMock.didCallStopLoading).to(beTrue())
                }
            }
            

            func configureSut(storage: StorageMock = StorageMock(),
                              service: LoginServiceMock = LoginServiceMock(loginResult: Result.success(LoginModelMock.valid())),
                              viewDelegate: LoginViewModelViewDelegateMock = LoginViewModelViewDelegateMock(),
                              controllerDelegate: LoginViewControllerDelegateMock = LoginViewControllerDelegateMock()) {
                
                storageMock = storage
                loginServiceMock = service
                viewDelegateMock = viewDelegate
                controllerDelegateMock = controllerDelegate
                sut = LoginViewModel(loginService: loginServiceMock, storage: storageMock)
                sut.viewDelegate = viewDelegateMock
                sut.controllerDelegate = controllerDelegateMock
            }
        }
    }
}

class LoginViewControllerDelegateMock: LoginViewControllerDelegate {
    var didCallShowAlert = false
    var didCallnavigateToStatement = false
    
    func showAlert(with message: String) {
        didCallShowAlert = true
    }
    
    func navigateToStatement(with user: UserAccount) {
        didCallnavigateToStatement = true
    }
}

class LoginViewModelViewDelegateMock: LoginViewModelViewDelegate {
    var didCallStartLoading = false
    var didCallStopLoading = false
    
    func startloading() {
        didCallStartLoading = true
    }
    
    func stopLoading() {
        didCallStopLoading = true
    }
}

class LoginServiceMock: LoginServiceProtocol {
    
    var network: NetworkCore = NetworkCore()
    
    var loginResult: Result<LoginModel, BaseNetworkError>
    
    init(loginResult: Result<LoginModel, BaseNetworkError>) {
        self.loginResult = loginResult
    }
    
    func fetchUser(user: String, password: String, completion: @escaping (Result<LoginModel, BaseNetworkError>) -> Void) {
        completion(loginResult)
    }
}


private class StorageMock: Storage {
    var didCallClearData = false
    var didCallSet = false
    var didCallGet = false
    
    func set(_ value: Data, forKey key: KeychainKeys) {
        didCallSet = true
    }
    
    func getData(_ key: KeychainKeys) -> Data? {
        didCallGet = true
        return nil
    }
    
    
    func clearData() {
        didCallClearData = true
    }
}
