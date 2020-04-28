//
//  StatementViewModel+Requester.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//
import Foundation
extension StatementViewModel {
    func fetchStatementst() {
        guard let userId = self.user.userId else { return }
        statementService.fetchStatements(with: userId) { (result: Result<StatementsModel, BaseNetworkError>) in
            switch result {
            case .success(let result):
                guard
                    let statements = result.statementList else {
                        self.factoryState = .error
                        return
                }
                
                self.factoryState = .success(statements)
            case .failure(_):
                self.factoryState = .error
            }
        }
    }
}
