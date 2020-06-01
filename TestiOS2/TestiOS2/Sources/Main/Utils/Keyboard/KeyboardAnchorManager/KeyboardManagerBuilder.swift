//
//  KeyboardManagerBuilder.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

protocol KeyboardManagerBuilder: class {
    var keyboardManager: KeyboardAnchorManager? { get set }

    var textFieldContainerView: UIView { get }
    var buttonContainerView: UIView { get }
    var topMostConstraint: NSLayoutConstraint? { get }
    var bottomMostConstraint: NSLayoutConstraint? { get }
}

extension KeyboardManagerBuilder where Self: UIView {
    func configureKeyboardManager(didShowKeyboardCallback: (() -> Void)? = nil) {
        keyboardManager = KeyboardAnchorManager(
            textFieldContainerView: textFieldContainerView,
            buttonContainerView: buttonContainerView,
            commonParentView: self,
            topMostConstraint: topMostConstraint ?? NSLayoutConstraint(),
            bottomMostConstraint: bottomMostConstraint ?? NSLayoutConstraint(),
            didShowKeyboardCallback: didShowKeyboardCallback
        )

        keyboardManager?.start()
    }
}

