//
//  UIView+Extensions.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

extension UIView {
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(closure(self))
    }
    
    func safeArea() -> UILayoutGuide {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide
        } else {
            return layoutMarginsGuide
        }
    }
    
    func addSubviewWithConstraints(subview: UIView, leading: CGFloat = 0.0, trailing: CGFloat = 0.0,
                                   top: CGFloat = 0.0, bottom: CGFloat = 0.0) {
        self.addSubview(subview)
        subview.constraint { view in
            [
                view.leadingAnchor.constraint(equalTo: safeArea().leadingAnchor, constant: leading),
                view.trailingAnchor.constraint(equalTo: safeArea().trailingAnchor, constant: trailing),
                view.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: top),
                view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor, constant: bottom)
            ]
        }
    }
}
