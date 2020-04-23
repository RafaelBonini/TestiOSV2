//
//  NetworkErrorProtocol.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol NetworkErrorProtocol {
    var responseStatus: ResponseStatus { get set }
    var error: Error? { get set }
    var data: Data? { get set }

    init(responseStatus: ResponseStatus, error: Error?, data: Data?)
}
