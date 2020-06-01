//
//  LoginViewModelProtocol.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

protocol LoginViewModelProtocol: class {
    var view: LoginViewProtocol? { get set }
    
    func login(cpfOrEmail: String?, password: String?)
    func loadCredentials() -> String
}
