//
//  NetworkErrorMock.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

@testable import TestiOS2

final class NetworkErrorMock: NetworkErrorProtocol {
    var responseStatus: ResponseStatus
    
    var error: Error?
    
    var data: Data?
    
    init(responseStatus: ResponseStatus,
         error: Error? = nil,
         data: Data? = nil) {
        self.responseStatus = responseStatus
        self.error = error
        self.data = data
    }
}
