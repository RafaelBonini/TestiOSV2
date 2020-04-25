//
//  StatementViewController.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class StatementViewController: UIViewController {
    
    let viewModel: StatementViewModel
    let contentView: StatementView
    init(viewModel: StatementViewModel) {
        self.viewModel = viewModel
        self.contentView = StatementView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = contentView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
