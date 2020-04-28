//
//  NetworkCoreMock.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 27/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

@testable import TestiOS2

class NetworkCoreMock: NetworkCore {
    private let result: NetworkResult
    
    init(result: NetworkResult = .failure) {
        self.result = result
    }
    
    override func requestCodable<T, U>(request: RequestProtocol, completion: @escaping (Result<T, U>) -> Void) where T : Decodable, T : Encodable, U : NetworkErrorProtocol {
        completion(result.result())
    }
}

enum NetworkResult {
    case success(data: Data)
    case failure
    
    func result<T: Codable, U: NetworkErrorProtocol>() -> Result<T, U> {
        switch self {
        case let .success(data):
            let data = try! JSONDecoder().decode(T.self, from: data)
            return .success(data)
        case .failure:
            let error = U(responseStatus: .notFound, error: nil, data: nil)
            return .failure(error)
        }
    }
}
