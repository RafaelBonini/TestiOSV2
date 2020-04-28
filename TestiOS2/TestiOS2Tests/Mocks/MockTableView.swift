//
//  MockTableView.swift
//  TestiOS2Tests
//
//  Created by Rafael Bonini de Souza on 28/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

@testable import TestiOS2

class MockTableView: UITableView {
    
    var registeredCells: [RegisteredCell] = []
    
    override func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        super.register(cellClass, forCellReuseIdentifier: identifier)
        
        let cell = RegisteredCell(classType: cellClass, reuseIdentifier: identifier)
        
        registeredCells.append(cell)
    }
    
    struct RegisteredCell {
        var classType: AnyClass?
        var reuseIdentifier: String
    }
    
}

extension MockTableView {
    
    static func makeMock() -> MockTableView {
        return MockTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), style: .plain)
    }
    
}
