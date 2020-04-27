//
//  String+Validations.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

extension String {
    
    func validatePasswordRegex() -> Bool {
        let passwordRegEx = "((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%]).{6,20})"
        let passwordValidator = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordValidator.evaluate(with: self)
    }
    
    func validateEmailRegex() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-](?!.*?\\.\\.)[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailValidator = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailValidator.evaluate(with: self)
    }

    func validateCpfRegex() -> Bool {
        let cpfRegex = "[0-9]{3}[0-9]{3}[0-9]{3}[0-9]{2}"
        let cpfValidator = NSPredicate(format: "SELF MATCHES %@", cpfRegex)
        return cpfValidator.evaluate(with: self)
    }
    
    func validateCpf() -> Bool {

        guard self.validateCpfRegex() else {
            return false
        }

        let cpf = self.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ".", with: "")

        if cpf.count == 11 {

            let firstDigitIndex = cpf.index(startIndex, offsetBy: 9)
            let firstDigit = Int(String(cpf[firstDigitIndex]))

            let secondDigitIndex = cpf.index(startIndex, offsetBy: 10)
            let secondDigit = Int(String(cpf[secondDigitIndex]))

            var temp1 = 0, temp2 = 0

            for indexDistance in 0...8 {

                let charIndex = cpf.index(startIndex, offsetBy: indexDistance)
                guard let char = Int(String(cpf[charIndex])) else {
                    continue
                }

                temp1 += char * (10 - indexDistance)
                temp2 += char * (11 - indexDistance)
            }

            temp1 %= 11
            temp1 = temp1 < 2 ? 0 : 11-temp1

            temp2 += temp1 * 2
            temp2 %= 11
            temp2 = temp2 < 2 ? 0 : 11-temp2

            if temp1 == firstDigit && temp2 == secondDigit {
                return true
            }

        }

        return false
    }
}
