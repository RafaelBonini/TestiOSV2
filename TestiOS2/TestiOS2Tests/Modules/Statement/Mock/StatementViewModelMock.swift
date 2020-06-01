//
//  StatementViewModelMock.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 30/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

@testable import TestiOS2

final class StatementViewModelMock: StatementViewModelProtocol {
    weak var view: StatementViewProtocol?
    var factoryState: StatementFactoryState = .loading
    
    var didCallBuildAccount = false
    var didCallLogout = false

    var user: UserAccount = UserAccount(userId: 1,
                                        name: "userAccount1",
                                        bankAccount: "12341234",
                                        agency: "1234",
                                        balance: 100.1)
    
    func buildUserAccount() -> String {
        didCallBuildAccount = true
        return ""
    }
    
    func logout() {
        didCallLogout = true
    }
}
