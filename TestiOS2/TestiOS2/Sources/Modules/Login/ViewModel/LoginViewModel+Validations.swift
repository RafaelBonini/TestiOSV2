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

    func cpfValidation(value: String?) -> String? {
        guard let value = value else { return nil }
        return validatingMessage(value, validation: .cpfEmail)
    }
    
    func passwordValidation(value: String?) -> String? {
        guard let value = value else { return nil }
        return validatingMessage(value, validation: .password)
    }
}
