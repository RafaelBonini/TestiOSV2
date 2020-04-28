//
//  TableViewDataSourceSpec.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Quick
import Nimble

@testable import TestiOS2

class TableViewDataSourceSpec: QuickSpec {
    
    override func spec() {
        
        describe("given TableViewDataSource") {
            
            var sut: TableViewDataSource!
            var sections: [MockTableViewSection] = []
            var tableView: MockTableView!
            
            beforeEach {
                
                tableView = MockTableView.makeMock()
                MockTableViewCellBuilder.mockCell.registerCellIdentifier(in: tableView)
                sections = [
                    MockTableViewSection.mockSection(withCellCount: 1),
                    MockTableViewSection.mockSection(withCellCount: 2),
                    MockTableViewSection.mockSection(withCellCount: 3)
                ]
                sut = TableViewDataSource(sections: sections, tableView: tableView)
                tableView.dataSource = sut
                tableView.delegate = sut
                
            }
            
            context("when requesting count of sections") {
                it("then it should return the count of sections registered on initialization") {
                    expect(sut.numberOfSections(in: tableView)).to(equal(sections.count))
                }
            }
            
            context("when requesting the number of rows of a section") {
                it("then it should return the forwarded count of rows from the underlying section") {
                    expect(sut.tableView(tableView, numberOfRowsInSection: 0)).to(equal(sections[0].numberOfRows))
                    expect(sut.tableView(tableView, numberOfRowsInSection: 1)).to(equal(sections[1].numberOfRows))
                    expect(sut.tableView(tableView, numberOfRowsInSection: 2)).to(equal(sections[2].numberOfRows))
                }
            }
            
            context("when requesting a cell") {
                it("then it should  return the cell from the cell builder at the respective section/row") {
                    
                    let row = 1
                    let section = 2
                    
                    _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
                    expect(sections[section].cellBuilders[row].didCallTableViewCellAtIndex).to(beTrue())
                }
                
            }
            
            context("when requesting the size of a cell") {
                let row = 1
                let section = 2
                
                beforeEach {
                    sections[section].cellBuilders[row].cellHeight = 127
                }
                
                it("then it should return the cell size directly from the cell builder instance") {
                    let size = sut.tableView(tableView, heightForRowAt: IndexPath(row: row, section: section))
                    expect(size).to(equal(sections[section].cellBuilders[row].cellHeight))
                }
                
            }
            
            context("when querying for the selectability of a cell") {
                it("then it should request the highlight status through the cell builder") {
                    
                    let indexPath = IndexPath(row: 1, section: 2)
                    
                    expect(sut.tableView(tableView, shouldHighlightRowAt: indexPath)).to(beFalse())
                    expect(sections[2].cellBuilders[1].didCallShouldSelectCell).to(beTrue())
                    
                }
                
                it("then id should request the selectability through the cell builder") {
                    let indexPath = IndexPath(row: 1, section: 2)
                    
                    expect(sut.tableView(tableView, willSelectRowAt: indexPath)).to(beNil())
                    expect(sections[2].cellBuilders[1].didCallShouldSelectCell).to(beTrue())
                }
            }
            
            context("when reporting the selection of a cell") {
                it("must inform the cell builder of the selection event") {
                    let indexPath = IndexPath(row: 1, section: 2)
                    sut.tableView(tableView, didSelectRowAt: indexPath)
                    expect(sections[2].cellBuilders[1].didCallDidSelectCell).to(beTrue())
                }
            }
        }
    }
}













