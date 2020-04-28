//
//  LoginRouter.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol: class {
    func navigateToStatement(with user: UserAccount)
}

final class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: LoginViewController?
    
    func navigateToStatement(with user: UserAccount) {
        
        let viewModel = StatementViewModel(user: user)
        let statementViewController = StatementViewController(viewModel: viewModel)
        
        viewController?.navigationController?.pushViewController(statementViewController, animated: true)
    }
}
