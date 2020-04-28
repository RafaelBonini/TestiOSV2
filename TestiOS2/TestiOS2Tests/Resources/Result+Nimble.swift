//
//  Result+Nimble.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 27/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Nimble

@testable import TestiOS2

func beASuccessCase<T, U: NetworkErrorProtocol>() -> Predicate<Result<T, U>> {
    return Predicate { actual in
        let msg = ExpectationMessage.expectedTo("have a success case")
        
        guard let actualValue = try actual.evaluate() else {
            return PredicateResult(
                status: .fail,
                message: msg.appendedBeNilHint()
            )
        }
        
        switch actualValue {
        case .success:
            return PredicateResult(bool: true, message: msg)
        default:
            return PredicateResult(bool: false, message: msg)
        }
    }
}


func beAFailureCase<T, U: NetworkErrorProtocol>() -> Predicate<Result<T, U>> {
    return Predicate { actual in
        let msg = ExpectationMessage.expectedTo("have a failure case")
        
        guard let actualValue = try actual.evaluate() else {
            return PredicateResult(
                status: .fail,
                message: msg.appendedBeNilHint()
            )
        }
        
        switch actualValue {
        case .failure:
            return PredicateResult(bool: true, message: msg)
        default:
            return PredicateResult(bool: false, message: msg)
        }
    }
}
