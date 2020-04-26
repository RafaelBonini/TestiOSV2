//
//  LoginViewControllerDelegate.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol LoginViewControllerDelegate: LoginRouterProtocol {
    func showAlert(with message: String)
}
