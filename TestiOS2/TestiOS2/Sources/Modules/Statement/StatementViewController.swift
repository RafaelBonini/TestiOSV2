//
//  StatementViewController.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

final class StatementViewController: UIViewController {
    
    let viewModel: StatementViewModel
    let contentView: StatementView
    var router: StatementRouter = StatementRouter()
    
    init(viewModel: StatementViewModel) {
        self.viewModel = viewModel
        self.contentView = StatementView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
        router.viewController = self
        viewModel.controllerDelegate = self
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.fetchStatementst()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatementViewController: StatementViewControllerDelegate {
    func showAlert(with message: String) {
        showAlertMessage(message: message)
    }
    
    func popStatementController() {
        self.router.popStatementController()
    }
}
