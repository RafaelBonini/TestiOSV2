//
//  StatementRequest.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Alamofire

enum StatementRequest: APIRequest {
    
    case fetchStatements(with: Int)
    
    var path: String {
        guard case let .fetchStatements(with: id) = self else { return "" }
        return "/statements/\(id)"
    }
    
    var method: RequestMethod { return .GET }
    
    var params: Parameters? { return .none }
}
