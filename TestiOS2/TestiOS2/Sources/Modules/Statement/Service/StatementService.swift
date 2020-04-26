//
//  StatementService.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol StatementServiceProtocol: ServiceProtocol {
    func fetchStatements(with id: Int, completion: @escaping (Result<StatementsModel, BaseNetworkError>) -> Void)
}

final class StatementService: StatementServiceProtocol {
    var network: NetworkCore
    
    init(network: NetworkCore = NetworkCore()) {
        self.network = network
    }

    func fetchStatements(with id: Int, completion: @escaping (Result<StatementsModel, BaseNetworkError>) -> Void) {
        let request = StatementRequest.fetchStatements(with: id)
        network.requestCodable(request: request, completion: completion)
    }
}
