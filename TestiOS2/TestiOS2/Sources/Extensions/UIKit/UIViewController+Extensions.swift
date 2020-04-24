//
//  UIViewController+Extensions.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

extension UIViewController {
  
    func showAlertMessage(title: String = R.string.localizable.commonErrorTitle(), message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.localizable.commonOk(), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
  }
}
