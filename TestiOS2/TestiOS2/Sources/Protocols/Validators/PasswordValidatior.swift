//
//  PasswordValidatior.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol PasswordValidatior: StringValidator {
    func validate(password: String?) -> Bool
}

extension PasswordValidatior {

    func validate(password: String?) -> Bool {
        guard let password = password else {
            return false
        }
        
        guard password.validatePasswordRegex() else {
            return false
        }

        return true
    }
}
