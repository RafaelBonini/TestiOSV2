//
//  StatementViewModel.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

class StatementViewModel {
    let user: UserAccount
    
    init(user: UserAccount) {
        self.user = user
    }
    
    func buildAccount() -> String {
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
