//
//  StatementTableViewCellSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import TestiOS2

class StatementTableViewCellSpec: QuickSpec {
    override func spec() {
        var sut: StatementTableViewCell!
        
        describe("given a StatementTableViewCell") {
            let expectedTitle = "expectedTitle"
            let expectedDesc = "expectedDesc"
            let expectedDate = "expectedDate"
            let expectedValue: Float = 10.10
            context("when configuring the cell") {
                beforeEach {
                    configureSut(title: expectedTitle, desc: expectedDesc, date: expectedDate, value: expectedValue)
                }
                
                it("then it should have set the data correctly") {
                    expect(sut.titleLabel.text).to(equal(expectedTitle))
                    expect(sut.descLabel.text).to(equal(expectedDesc))
                    expect(sut.dateLabel.text).to(equal(expectedDate))
                    expect(sut.valueLabel.text).to(equal(expectedValue.currencyFormatter()))
                }
                
                it("then it should have clear background color") {
                    expect(sut.backgroundColor?.cgColor.alpha).to(equal(0))
                }
            }
        }
        func configureSut(title: String,
        desc: String,
        date: String,
        value: Float) {
            sut = StatementTableViewCell(frame: .zero)
            sut.configure(
                title: title,
                desc: desc,
                date: date,
                value: value
            )
        }
    }
}
