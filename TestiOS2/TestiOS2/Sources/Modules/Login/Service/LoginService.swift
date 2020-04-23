//
//  LoginService.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

protocol LoginServiceProtocol: ServiceProtocol {
    func fetchUser(user: String, password: String, completion: @escaping (Result<LoginModel, BaseNetworkError>) -> Void)
}

final class LoginService: LoginServiceProtocol {
    var network: NetworkCore
    
    init(network: NetworkCore = NetworkCore()) {
        self.network = network
    }
    
    func fetchUser(user: String, password: String, completion: @escaping (Result<LoginModel, BaseNetworkError>) -> Void) {
        let request = LoginRequest.login(user: user, password: password)
        network.requestCodable(request: request, completion: completion)
    }
}
