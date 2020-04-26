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
    
    private lazy var textFieldsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 21
        
        return stack
    }()
    
    private lazy var userTextField: LoginTextField = {
        let textfield = LoginTextField(
            placeholder: R.string.localizable.textfieldUserPlaceholderText()
        )
        textfield.keyboardType = .emailAddress
        textfield.returnKeyType = .next
        textfield.addTarget(self, action: #selector(nextReturnKeyTap), for: .primaryActionTriggered)
        if #available(iOS 11.0, *) {
            textfield.textContentType = .username
        }
        textfield.text = viewModel.loadCredentials() ?? ""
        
        return textfield
    }()
    
    private lazy var passwordTextField: LoginTextField = {
        let textfield = LoginTextField(
            placeholder: R.string.localizable.textfieldPasswordPlaceholderText()
        )
        textfield.returnKeyType = .done
        textfield.addTarget(self, action: #selector(loginTapped), for: .primaryActionTriggered)
        textfield.isSecureTextEntry = true
        if #available(iOS 11.0, *) {
            textfield.textContentType = .password
        }
        
        return textfield
    }()
    
    private lazy var loginButton: LoginButton = {
        let button = LoginButton(
            title: R.string.localizable.buttonTitleLogin()
        )
        button.backgroundColor = AppColors.custom.strongBlue
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonContainerView: UIView = {
        return loginButton
    }()
    
    lazy var textFieldContainerView: UIView = {
       return textFieldsStackView
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.viewDelegate = self
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func nextReturnKeyTap(){
        passwordTextField.becomeFirstResponder()
    }
    
    @objc func loginTapped() {
        self.viewModel.login(cpfOrEmail: userTextField.text, password: passwordTextField.text)
    }
}

extension LoginView: LoginViewModelViewDelegate {
    func startloading() {
        loginButton.loading()
    }
    
    func stopLoading() {
        loginButton.stoploading()
    }
}

extension LoginView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(logoImageView)
        
        addSubview(textFieldsStackView)
        textFieldsStackView.addArrangedSubview(userTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)

        addSubview(loginButton)
    }
    
    func setupConstraints() {
        
        let topConstraint = logoImageView.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: 36)
        topMostConstraint = topConstraint
        
        logoImageView.constraint { view in
            [topConstraint,
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        textFieldsStackView.constraint { view in
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
