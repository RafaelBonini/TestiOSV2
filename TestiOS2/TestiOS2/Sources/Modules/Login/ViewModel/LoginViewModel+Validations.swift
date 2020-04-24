//
//  LoginViewModel+Validations.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

extension LoginViewModel: CPFEmailValidator, PasswordValidatior {
    func errorMessage(validation: Validation) -> String {
        switch validation {
        case .cpfEmail: return R.string.localizable.userErrorDesc()
        case .password: return R.string.localizable.passwordErrorDesc()
        }
    }

    func cpfEmailValidation(value: String?) -> Bool {
        guard let value = value else { return false }
        guard let message = validatingMessage(value, validation: .cpfEmail) else { return true }
        controllerDelegate?.showAlert(with: message)
        return false
    }
    
    func passwordValidation(value: String?) -> Bool {
        guard let value = value else { return false }
        guard let message = validatingMessage(value, validation: .password) else { return true }
        controllerDelegate?.showAlert(with: message)
        return false
    }
}
