//
//  Identifiable.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

public protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable where Self: UIView {
    public static var identifier: String {
        return "\(Self.self)"
    }
}
