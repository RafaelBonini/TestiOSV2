//
//  StringValidator.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

enum Validation: String {
    case cpfEmail
    case password
}

protocol StringValidator {
    func validate(_: String, validation: Validation) -> Bool
}

extension StringValidator {
    func validate(_ value: String, validation: Validation) -> Bool {
        switch validation {
        case .cpfEmail: return (self as? CPFEmailValidator)?.validate(cpfEmail: value) ?? false
        case .password: return (self as? PasswordValidatior)?.validate(password: value) ?? false
        }
    }
}
