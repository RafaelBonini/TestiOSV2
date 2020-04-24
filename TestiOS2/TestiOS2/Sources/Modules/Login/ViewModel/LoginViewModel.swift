//
//  LoginViewModel.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    weak var controllerDelegate: ViewControllerDelegate?
    let loginService: LoginServiceProtocol

    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }

    func login(cpfOrEmail: String?, password: String?) {
        guard cpfEmailValidation(value: cpfOrEmail),
            passwordValidation(value: password) else { return }
        
        guard let user = cpfOrEmail, let password = password else { return }
        loginRequest(with: user, password: password)
    }
    
    func treatLoginSuccess(with user: UserAccount) {
        controllerDelegate?.navigateToStatement(with: user)
    }
    
    func treatLoginFailure() {
    }
    
    private func showAlert(with message: String) {
        
    }
}
