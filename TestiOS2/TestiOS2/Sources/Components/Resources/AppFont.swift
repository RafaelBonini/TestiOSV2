//
//  AppFont.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

struct AppFont {
    static func defaultRegularFontWithSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "HelveticaNeue", size: size)
    }
    
    static func defaultLightFontWithSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    
    static func defaultSemiBoldFontWithSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "HelveticaNeue-Semibold", size: size)!
    }
    
}
