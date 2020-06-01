//
//  StatementCellBuilderSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 31/05/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import TestiOS2

class StatementCellBuilderSpec: QuickSpec {
    override func spec() {
        var sut: StatementCellBuilder!
        var tableView: UITableView!
        
        describe("given a StatementCellBuilder") {
            beforeEach {
                sut = StatementCellBuilder(item: Statements(title: "", desc: "", date: "", value: nil))
                tableView = MockTableView.makeMock()
                sut.registerCellIdentifier(in: tableView)
            }
            
            context("when instantiating") {
                it("then it should have automatic dimension height") {
                    expect(sut.cellHeight).to(equal(UITableView.automaticDimension))
                }
                
                it("then it should not be selectable") {
                    expect(sut.tableViewShouldSelectCell(tableView)).to(beFalse())
                }
                
                it("then it should return a StatementTableViewCell type of cell") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    expect(sut.tableViewCell(at: indexPath, on: tableView) as? StatementTableViewCell).toNot(beNil())
                }
            }
        }
    }
}
