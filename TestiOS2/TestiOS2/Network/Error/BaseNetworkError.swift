//
//  BaseNetworkError.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation.NSData

class BaseNetworkError: NetworkErrorProtocol {
    var responseStatus: ResponseStatus
    var error: Error?
    var data: Data?

    required init(responseStatus: ResponseStatus, error: Error? = nil, data: Data? = nil) {
        self.responseStatus = responseStatus
        self.error = error
        self.data = data
    }
}
