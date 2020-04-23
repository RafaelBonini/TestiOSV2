//
//  Result.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

enum Result<T, U: NetworkErrorProtocol> {
    case success(T)
    case failure(U)

    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    public var isFailure: Bool {
        return !isSuccess
    }

    public var value: T? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    public var error: U? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
