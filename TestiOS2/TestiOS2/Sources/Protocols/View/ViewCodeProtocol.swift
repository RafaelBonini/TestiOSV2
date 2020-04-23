//
//  ViewCodeProtocol.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol ViewCodeProtocol {
    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()

    func buildView()
}

extension ViewCodeProtocol {
    func buildView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() { }
}
