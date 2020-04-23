//
//  LoginTextField.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 5)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setTextField(placeHolder: placeholder)
    }
    
    private func setTextField(placeHolder: String) {
        setFont()
        setPlaceholder(placeHolder: placeHolder)
        setBorder()
    }
    
    private func setFont() {
        font = UIFont(name: "Helvetica Neue", size: 15)
        textColor = AppColors.custom.placeHolderlightBlue
    }
    private func setPlaceholder(placeHolder: String) {
        attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.custom.placeHolderlightBlue]
        )
    }
    
    private func setBorder() {
        self.layer.borderColor = AppColors.custom.borderlightBlue.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
