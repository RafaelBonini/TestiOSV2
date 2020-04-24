//
//  CPFEmailValidator.swift.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol CPFEmailValidator: StringValidator {
    func validate(cpfEmail: String?) -> String?
    func validate(cpfEmail: String?) -> Bool
}

extension CPFEmailValidator {

    func validate(cpfEmail: String?) -> Bool {
        guard let cpfEmail = cpfEmail else {
            return false
        }

        guard cpfEmail.validateCpf() else {
            return false
        }
        
        guard cpfEmail.validateEmailRegex() else {
            return false
        }

        return true
    }

    func validate(cpfEmail: String?) -> String? {
        guard
            let cpfEmail = cpfEmail,
            !cpfEmail.isEmpty,
            !cpfEmail.validateCpf(),
            !cpfEmail.validateEmailRegex()
            else { return nil }

        return errorMessage(validation: .cpfEmail)
    }
}
