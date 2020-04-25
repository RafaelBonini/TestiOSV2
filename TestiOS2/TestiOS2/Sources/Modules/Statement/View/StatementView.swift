//
//  StatementView.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class StatementView: UIView {
    
    let viewModel: StatementViewModel
    
    init(viewModel: StatementViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatementView: ViewCodeProtocol {
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    func additionalSetup() {
        backgroundColor = .white
    }
}
