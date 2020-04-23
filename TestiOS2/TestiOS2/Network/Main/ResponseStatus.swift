//
//  ResponseStatus.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

enum ResponseStatus {
    case success
    case emptyData
    case notFound
    case unprocessable
    case tooManyRequests
    case unauthorized
    case forbidden
    case conflict
    case parseError
    case internalServerError
    case serviceUnavaliable
    case unknown

    init(statusCode: Int?) {
        switch statusCode ?? 0 {
        case 200..<300:
            self = .success
        case 404:
            self = .notFound
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 422:
            self = .unprocessable
        case 429:
            self = .tooManyRequests
        case 409:
            self = .conflict
        case 500:
            self = .internalServerError
        case 501:
            self = .serviceUnavaliable
        case 999:
            self = .parseError
        default:
            self = .unknown
        }
    }
}
