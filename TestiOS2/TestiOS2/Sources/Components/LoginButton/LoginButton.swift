//
//  LoginButton.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    
    init(title: String){
        super.init(frame: .zero)
        setButton(title: title)
    }
    
    private func setButton(title: String) {
        setTitle(title: title)
        setBorder()
    }
    
    private func setTitle(title: String) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        self.titleLabel?.textColor = .white
    }
    
    private func setBorder() {
        self.layer.cornerRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
