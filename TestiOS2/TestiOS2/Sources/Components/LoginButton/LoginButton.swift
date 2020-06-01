//
//  LoginButton.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    
    private let buttonTitle: String
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let aIndicator = UIActivityIndicatorView(style: .white)
        aIndicator.hidesWhenStopped = true
        return aIndicator
    }()
    
    init(title: String){
        self.buttonTitle = title
        super.init(frame: .zero)
        buildView()
    }
    
    func loading() {
        isEnabled = false
        setTitle("", for: .normal)
        activityIndicator.startAnimating()
    }
    
    func stoploading() {
        isEnabled = true
        setTitle(buttonTitle, for: .normal)
        activityIndicator.stopAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginButton: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        activityIndicator.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
    }
    func additionalSetup() {
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = AppFont.defaultRegularFontWithSize(size: 16)
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = 4
    }
}
