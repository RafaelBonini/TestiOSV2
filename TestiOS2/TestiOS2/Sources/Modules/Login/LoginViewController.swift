//
//  LoginViewController.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewModel: LoginViewModel
    let contentView: LoginView
    var router: LoginRouter = LoginRouter()
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        self.contentView = LoginView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
        self.viewModel.controllerDelegate = self
        self.router.viewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        view = contentView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    func navigateToStatement(with user: UserAccount) {
        self.router.navigateToStatement(with: user)
    }
    
    func showAlert(with message: String) {
        showAlertMessage(message: message)
    }
}
