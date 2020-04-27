//
//  StatementViewControllerDelegate.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

protocol StatementViewControllerDelegate: StatementRouterProtocol {
        func showAlert(with message: String)
}
