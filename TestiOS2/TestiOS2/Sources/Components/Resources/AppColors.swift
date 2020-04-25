//
//  AppColors.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class AppColors: UIColor {
    static let custom = CustomColors()
}

struct CustomColors {
    let placeHolderlightBlue = UIColor(red: 168/255, green: 180/255, blue: 196/255, alpha: 1)
    let borderlightBlue = UIColor(red: 220/255, green: 226/255, blue: 238/255, alpha: 1)
    let strongBlue = UIColor(red: 59/255, green: 72/255, blue: 238/255, alpha: 1)
    let whiteBackground = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    let darkGray = UIColor(red: 72/255, green: 84/255, blue: 101/255, alpha: 1)
}
