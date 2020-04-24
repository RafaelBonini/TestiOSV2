//
//  LoginView.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class LoginView: UIView, KeyboardManagerBuilder {
    
    var keyboardManager: KeyboardAnchorManager?
    var topMostConstraint: NSLayoutConstraint?
    var bottomMostConstraint: NSLayoutConstraint?
    
    let viewModel: LoginViewModel
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo_icon()
        
        return imageView
    }()
    
    private lazy var textFieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 21
        
        return stack
    }()
    
    private lazy var userTextField: LoginTextField = {
        let textfield = LoginTextField(
            placeholder: R.string.localizable.textfieldUserPlaceholderText()
        )
        
        return textfield
    }()
    
    private lazy var passwordTextField: LoginTextField = {
        let textfield = LoginTextField(
            placeholder: R.string.localizable.textfieldPasswordPlaceholderText()
        )
        
        return textfield
    }()
    
    private lazy var loginButton: LoginButton = {
        let button = LoginButton(
            title: R.string.localizable.buttonTitleLogin()
        )
        button.backgroundColor = AppColors.custom.strongBlue
        
        return button
    }()
    
    lazy var buttonContainerView: UIView = {
        return loginButton
    }()
    
    lazy var textFieldContainerView: UIView = {
       return textFieldsStack
    }()
    
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
        addSubview(logoImageView)
        
        addSubview(textFieldsStack)
        textFieldsStack.addArrangedSubview(userTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)

        addSubview(loginButton)
    }
    
    func setupConstraints() {
        
        let topConstraint = logoImageView.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: 36)
        topMostConstraint = topConstraint
        
        logoImageView.constraint { view in
            [topConstraint,
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        textFieldsStack.constraint { view in
            [view.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 105),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)]
        }
        
        userTextField.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 50)]
        }
        
        passwordTextField.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 50)]
        }
        
        let bottomConstraint = bottomAnchor.constraint(equalTo: loginButton.bottomAnchor,
                                                                  constant: 42)
        bottomMostConstraint = bottomConstraint
        
        loginButton.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
             /*view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),*/
             view.heightAnchor.constraint(equalToConstant: 50),
             view.widthAnchor.constraint(equalToConstant: 190),
            bottomConstraint]
        }
    }
    
    func additionalSetup() {
        backgroundColor = .white
        configureKeyboardManager()
    }
}

