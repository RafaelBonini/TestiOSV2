//
//  NetworkCore.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Alamofire

class NetworkCore {
    
    let alamofireManager = Alamofire.SessionManager.default
    
    static let downloadManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 3 * 60
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    public func requestCodable<T: Codable, U> (request: RequestProtocol,
                                               completion: @escaping (Result<T, U>) -> Void) {
        
        if !Connectivity.isConnectedToNetwork() {
            completion(.failure(U(responseStatus: .serviceUnavaliable, error: nil, data: nil)))
            return
        }
        
        let requestType = request.method.asHTTPMethod()
        let url = request.baseURL + request.path
        let params = request.params
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        var encoded: ParameterEncoding = JSONEncoding.default
        
        if requestType == .get {
            encoded = URLEncoding.default
        }
        
        Alamofire.request(url,
                          method: requestType,
                          parameters: params, encoding: encoded, headers: headers)
            .responseJSON { (response) in
                
                switch response.result {
                    
                case .success:
                    
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data ?? Data())
                        completion(.success(data))
                    } catch (let error) {
                        let error = U(
                            responseStatus: ResponseStatus(statusCode: response.response?.statusCode),
                            error: error,
                            data: response.data
                        )
                        completion(.failure(error))
                    }
                    
                case .failure(let error):
                    let error = U(
                        responseStatus: ResponseStatus(statusCode: response.response?.statusCode),
                        error: error,
                        data: response.data
                    )
                    completion(.failure(error))
                }
        }
    }
}
