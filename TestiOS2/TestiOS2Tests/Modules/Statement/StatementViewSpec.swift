//
//  StatementViewSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 30/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestiOS2

final class StatementViewSpec: QuickSpec {
    override func spec() {
        
        describe("Given a statement view") {
            var sut: StatementView!
            var viewModelMock: StatementViewModelMock!
            
            context("When the view is configured") {
                beforeEach {
                    viewModelMock = StatementViewModelMock()
                    sut = StatementView(viewModel: viewModelMock)
                }
                
                it("then it should be built with the correct data") {
                    expect(sut.nameLabel.text).to(equal(viewModelMock.user.name))
                    expect(sut.recentLabel.text).to(equal(R.string.localizable.statementRecentLabel()))
                    
                    expect(sut.accountView.titleLabel.text).to(equal(R.string.localizable.statementAccountLabel()))
                    expect(sut.accountView.valueLabel.text).to(equal(viewModelMock.buildUserAccount()))
                    
                    expect(sut.balanceView.titleLabel.text).to(equal(R.string.localizable.statementBalanceLabel()))
                    expect(sut.balanceView.valueLabel.text).to(equal(viewModelMock?.user.balance?.currencyFormatter()))   
                }
            }
            
            context("when the logout action is triggered") {
                beforeEach {
                    sut.tapLogoutButton()
                }
                
                it("should then relay the action to the view model") {
                    expect(viewModelMock.didCallLogout).to(beTrue())
                }
            }
        }
    }
}
