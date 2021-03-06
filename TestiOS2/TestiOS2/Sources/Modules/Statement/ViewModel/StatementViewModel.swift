//
//  StatementViewModel.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

final class StatementViewModel: StatementViewModelProtocol {
    var view: StatementViewProtocol?
    let user: UserAccount
    
    weak var controllerDelegate: StatementViewControllerDelegate?
    
    let statementService: StatementServiceProtocol
    private var dataSource: TableViewDataSource?
    var factoryState: StatementFactoryState {
        didSet {
            updateUI()
            view?.reloadTable()
        }
    }
    
    init(user: UserAccount,
         statementService: StatementServiceProtocol = StatementService()) {
        self.user = user
        self.statementService = statementService
        factoryState = .loading
    }
    
    func updateUI() {
        switch factoryState {
        case .success:
            view?.stoploading()
        case .loading:
            view?.startloading()
        case .error:
            view?.stoploading()
            treatFailure()
        }
    }
    
    func treatFailure() {
        controllerDelegate?.showAlert(with: R.string.localizable.commonServiceErrorDesc())
    }
    
    @objc func logout() {
        controllerDelegate?.popStatementController()
    }
    
    func buildUserAccount() -> String {
        guard let bankAccount = user.bankAccount else { return ""}
        return bankAccount + " / " + formatAgency()
    }
    
    private func formatAgency() -> String {
        guard let agency = user.agency,
            agency.count == 9 else {
                return user.agency ?? ""
        }
        
        let mutableString: NSMutableString = NSMutableString(string: agency)
        mutableString.insert(".", at: 2)
        mutableString.insert("-", at: 9)
        
        return String(mutableString)
    }
}
