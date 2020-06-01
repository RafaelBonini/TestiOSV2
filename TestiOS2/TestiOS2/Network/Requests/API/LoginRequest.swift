//
//  LoginRequest.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Alamofire

enum LoginRequest: APIRequest {
    
    case login(user: String, password: String)
    
    var path: String { return "/login" }
    
    var method: RequestMethod { return .POST }
    
    var params: Parameters? {
        guard case let .login(user, password) = self else { return .none }
        return [
            "user": user,
            "password": password
        ]
    }
}
