//
//  MockTableViewCellBuilder.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

@testable import TestiOS2

open class MockTableViewCellBuilder: TableViewCellBuilder {
    
    var didCallRegisterCellIdentifier: Bool = false
    var didCallTableViewCellAtIndex: Bool = false
    var didCallShouldSelectCell: Bool = false
    var didCallDidSelectCell: Bool = false
    
    public var cellHeight: CGFloat
    
    public init(cellHeight: CGFloat) {
        
        self.cellHeight = cellHeight
        
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        
        didCallRegisterCellIdentifier = true
        
        tableView.register(MockTableViewCell.self,
                           forCellReuseIdentifier: "\(MockTableViewCell.self)")
        
    }
    
    open func tableViewCell(at indexPath: IndexPath,
                            on tableView: UITableView) -> UITableViewCell {
        
        didCallTableViewCellAtIndex = true
        
        return UITableViewCell()
    }
    
    open func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        
        didCallShouldSelectCell = true
        
        return false
        
    }
    
    open func tableViewDidSelectCell(_ tableView: UITableView) {
        
        didCallDidSelectCell = true
        
    }
    
}

public extension MockTableViewCellBuilder {
    
    static var mockCell: MockTableViewCellBuilder {
        return MockTableViewCellBuilder(cellHeight: 100)
    }
    
}

open class MockTableViewCell: UITableViewCell {
    
}


