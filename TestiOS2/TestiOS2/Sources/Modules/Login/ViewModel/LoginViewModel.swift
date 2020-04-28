//
//  LoginViewModel.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

final class LoginViewModel {
    
    weak var controllerDelegate: LoginViewControllerDelegate?
    weak var viewDelegate: LoginViewModelViewDelegate?
    let loginService: LoginServiceProtocol
    let storage: Storage

    init(loginService: LoginServiceProtocol = LoginService(),
         storage: Storage = KeychainSwift()) {
        self.loginService = loginService
        self.storage = storage
    }

    func login(cpfOrEmail: String?, password: String?) {
        guard validate(cpfEmail: cpfOrEmail),
            validate(password: password) else {
                controllerDelegate?.showAlert(with: R.string.localizable.commonLoginErrorDesc())
                return }
        
        guard let user = cpfOrEmail, let password = password else { return }
        loginRequest(with: user, password: password)
    }
    
    
    func saveCredentials(cpfOrEmail: String) {
        guard let cpfOrEmail = cpfOrEmail.data(using: .utf8) else { return }
        storage.set(cpfOrEmail, forKey: .emailOrCpf)
    }
    
    func loadCredentials() -> String? {
        guard
            let user = storage.getData(.emailOrCpf) else {
                return ""
        }
        let userDecoded = String(data: user, encoding: .utf8)

        return userDecoded
    }
    
    func treatLoginSuccess(with user: UserAccount) {
        controllerDelegate?.navigateToStatement(with: user)
    }
    
    func treatLoginFailure() {
        controllerDelegate?.showAlert(with: R.string.localizable.commonServiceErrorDesc())
    }
}

extension LoginViewModel: CPFEmailValidator, PasswordValidatior { }
