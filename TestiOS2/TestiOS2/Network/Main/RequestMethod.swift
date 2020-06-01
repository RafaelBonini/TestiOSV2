//
//  Method.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Alamofire

enum RequestMethod {
    case GET
    case POST
}

extension RequestMethod {
    func asHTTPMethod() -> HTTPMethod {
        switch self {
        case .GET: return .get
        case .POST: return .post
        }
    }
}
