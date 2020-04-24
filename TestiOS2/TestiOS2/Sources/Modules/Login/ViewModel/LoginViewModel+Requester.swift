//
//  LoginViewModel+Requester.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

extension LoginViewModel {
    func loginRequest(with cpfOrEmail: String, password: String) {
        loginService.fetchUser(user: cpfOrEmail, password: password) { (result: Result<LoginModel, BaseNetworkError>) in
            switch result {
            case .success(let result):
                guard
                    let _ = result.error,
                    let user = result.userAccount else {
                        self.treatLoginFailure()
                        return
                }
                
                self.treatLoginSuccess(with: user)
            case.failure(_):
                self.treatLoginFailure()
            }
        }
    }
}
