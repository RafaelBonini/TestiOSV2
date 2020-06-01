//
//  LoginViewModelMock.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

@testable import TestiOS2

final class LoginViewModelMock: LoginViewModelProtocol {
    var didCallLogin = false
    var didCallLoadCredentials = false

    weak var view: LoginViewProtocol?
    
    func login(cpfOrEmail: String?, password: String?) {
        didCallLogin = true
    }
    
    func loadCredentials() -> String {
        didCallLoadCredentials = true
        return "redentials"
    }
}
