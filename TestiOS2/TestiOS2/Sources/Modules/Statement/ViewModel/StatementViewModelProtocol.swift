//
//  StatementViewModelProtocol.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 30/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol StatementViewModelProtocol: class {
    var view: StatementViewProtocol? { get set }
    var user: UserAccount { get }
    var factoryState: StatementFactoryState { get }
    func buildUserAccount() -> String
    func logout()
}
