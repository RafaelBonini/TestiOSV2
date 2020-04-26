//
//  StatementRouter.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

protocol StatementRouterProtocol: class {
    func popStatementController()
}

class StatementRouter: StatementRouterProtocol {
    
    weak var viewController: StatementViewController?
    
    func popStatementController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
