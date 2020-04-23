//
//  LoginView.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LoginView: ViewCodeProtocol {
    func setupHierarchy() {
    }
    
    func setupConstraints() {
    }
    
    func additionalSetup() {
        backgroundColor = .white
    }
}
