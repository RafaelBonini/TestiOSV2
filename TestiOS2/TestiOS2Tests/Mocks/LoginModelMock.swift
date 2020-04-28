//
//  LoginModelMock.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
@testable import TestiOS2

class LoginModelMock {
    
    static let loginResponse = LoginModel(userAccount: UserAccount(userId: 1, name: "User testing", bankAccount: "1234", agency: "123412341", balance: 123.23), error: ResponseError(code: 1, message: "error 1"))

    static func valid() -> LoginModel {
        return loginResponse
    }

    static func invalid() -> LoginModel {
        return LoginModel(userAccount: nil, error: nil)
    }
    
    static func asData() -> Data? {
        let json = try? JSONEncoder().encode(loginResponse)
        return json
    }
}

