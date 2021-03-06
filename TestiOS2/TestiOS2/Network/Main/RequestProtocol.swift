//
//  RequestProtocol.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Alamofire

protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var params: Parameters? { get }
}
