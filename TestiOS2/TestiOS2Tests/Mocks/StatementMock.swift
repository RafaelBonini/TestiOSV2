//
//  StatementMock.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

import Foundation
@testable import TestiOS2

class StatementMock {
    
    static let statementResponse = StatementsModel(statementList: [Statements(title: "title1", desc: "desc1", date: "10-10-2010", value: 101.1),Statements(title: "title2", desc: "desc2", date: "10-10-2010", value: 108.1),Statements(title: "title3", desc: "desc3", date: "10-10-2010", value: 120.1)], error: nil)

    static func valid() -> StatementsModel {
        return statementResponse
    }

    static func invalid() -> StatementsModel {
        return StatementsModel(statementList: nil, error: nil)
    }
    
    static func asData() -> Data? {
        let json = try? JSONEncoder().encode(statementResponse)
        return json
    }
}

