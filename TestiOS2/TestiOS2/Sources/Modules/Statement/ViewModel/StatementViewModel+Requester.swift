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
        statementService.fetchStatements(with: self.user.userId ?? -1) { (result: Result<StatementsModel, BaseNetworkError>) in
            switch result {
            case .success(let model):
                
                guard let statements = model.statementList else { return }
                self.factoryState = .success(statements)
            case .failure(let error):
                print(error)
            }
        }
    }
}
