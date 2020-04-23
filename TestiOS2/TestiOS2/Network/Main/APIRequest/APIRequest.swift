//
//  APIRequest.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol APIRequest: RequestProtocol { }

extension APIRequest {
    var baseURL: String { return URLs().baseURL }
}
