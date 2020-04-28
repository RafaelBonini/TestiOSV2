//
//  MockTableViewSection.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

@testable import TestiOS2

open class MockTableViewSection: TableViewSection {
    
    open var cellBuilders: [MockTableViewCellBuilder]
    open var header: UIView?
    open var footer: UIView?
    
    open var numberOfRows: Int {
        return cellBuilders.count
    }
    
    public init(cellBuilders: [MockTableViewCellBuilder]) {
        self.cellBuilders = cellBuilders
    }
    
    public func registerCells(in tableView: UITableView) {
        
    }
    
    open func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat {
        return cellBuilders[indexPath.row].cellHeight
    }
    
    open func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        return cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
    }
    
    open func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].tableViewShouldSelectCell(tableView)
    }
    
    open func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        cellBuilders[indexPath.row].tableViewDidSelectCell(tableView)
    }
    
    public func tableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return footer
    }
    
    public func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return header
    }
    
    public func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat {
        if header != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
    public func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat {
        if footer != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
}


extension MockTableViewSection {
    
    static func mockSections(count: Int, withCellCount cellCount: Int) -> [MockTableViewSection] {
        let sections = (0..<count).map { _ in
            return mockSection(withCellCount: cellCount)
        }
        
        return sections
    }
    
    static func mockSection(withCellCount count: Int) -> MockTableViewSection {
        let cells = (0..<count).map { _ in
            return MockTableViewCellBuilder.mockCell
        }
        
        return MockTableViewSection(cellBuilders: cells)
    }
    
}
