//
//  Float+Extensions.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

extension Float {
  func currencyFormatter() -> String? {
    let nformatter = NumberFormatter()
    nformatter.minimumFractionDigits = 2
    nformatter.maximumFractionDigits = 2
    nformatter.numberStyle = .currency
    nformatter.locale = Locale(identifier: "pt_BR")
    nformatter.currencySymbol = "R$"
    return nformatter.string(from: self as NSNumber)
  }
}
