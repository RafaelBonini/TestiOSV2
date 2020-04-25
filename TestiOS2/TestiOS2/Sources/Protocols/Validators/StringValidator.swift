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
    func validate(_: String, _ confirmation: String?,
                  validation: Validation) -> Bool
//    func validatingMessage(_: String, _ confirmation: String?,
//                           validation: Validation,
//                           enableRequiredFieldRule: Bool) -> String?
}

extension StringValidator {

    func validate(_ value: String, _ confirmation: String? = nil, validation: Validation) -> Bool {
        switch validation {
        case .cpfEmail: return (self as? CPFEmailValidator)?.validate(cpfEmail: value) ?? false
        case .password: return (self as? PasswordValidatior)?.validate(password: value) ?? false
        }
    }

//    func validatingMessage(_ value: String, _ confirmation: String? = nil,
//                           validation: Validation, enableRequiredFieldRule: Bool = false) -> String? {
//
//        switch validation {
//        case .cpfEmail: return (self as? CPFEmailValidator)?.validate(cpfEmail: value)
//        case .password: return (self as? PasswordValidatior)?.validate(password: value)
//        }
//    }
}
