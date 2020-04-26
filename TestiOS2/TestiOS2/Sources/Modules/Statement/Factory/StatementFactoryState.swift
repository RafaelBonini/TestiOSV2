//
//  StatementFactoryState.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

enum StatementFactoryState {
    case success([Statements])
    case loading
    case error

    var statements: [Statements] {
        if case let .success(statements) = self {
            return statements
        }

        return []
    }
}
