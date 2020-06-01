//
//  StatementView.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

final class StatementView: UIView {
    
    private let viewModel: StatementViewModelProtocol
    private var dataSource: TableViewDataSource?
    
    private lazy var topPortionContainer: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.custom.strongBlue
        
        return view
    }()
    
     private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultLightFontWithSize(size: 25)
        label.textColor = .white
        label.text = self.viewModel.user.name
        
        return label
    }()
    
     private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.logout_icon(), for: .normal)
        button.addTarget(self, action: #selector(tapLogoutButton), for: .touchUpInside)
        
        return button
    }()
    
     private(set) lazy var accountView: StatementTitleValueView = {
        let view = StatementTitleValueView(
            title: R.string.localizable.statementAccountLabel(),
            value: self.viewModel.buildUserAccount()
        )
        
        return view
    }()
    
     private(set) lazy var balanceView: StatementTitleValueView = {
        let view = StatementTitleValueView(
            title: R.string.localizable.statementBalanceLabel(),
            value: self.viewModel.user.balance?.currencyFormatter() ?? ""
        )
        
        return view
    }()
    
     private(set) lazy var recentLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultRegularFontWithSize(size: 17)
        label.textColor = AppColors.custom.darkGrey
        label.text = R.string.localizable.statementRecentLabel()
        
        return label
    }()
    
    private lazy var statementTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 95
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundView = self.loadingIndicator
        
        return tableView
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.startAnimating()
        
        return indicator
    }()
    
    init(viewModel: StatementViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.view = self
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapLogoutButton() {
        viewModel.logout()
    }
    
    private func reloadDataSource() {
        let factory = StatementFactory(state: viewModel.factoryState)
        
        self.dataSource = TableViewDataSource(
            sections: factory.make(),
            tableView: statementTableView
        )
        statementTableView.reloadData()
    }
}

extension StatementView: StatementViewProtocol {
    func reloadTable() {
        reloadDataSource()
    }

    func startloading() {
        self.loadingIndicator.startAnimating()
    }
    
    func stoploading() {
        loadingIndicator.stopAnimating()
    }
}

extension StatementView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(topPortionContainer)
        
        topPortionContainer.addSubview(nameLabel)
        topPortionContainer.addSubview(logoutButton)
        topPortionContainer.addSubview(accountView)
        topPortionContainer.addSubview(balanceView)
        
        addSubview(recentLabel)
        addSubview(statementTableView)
    }
    
    func setupConstraints() {
    
        topPortionContainer.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)]
        }
        
        nameLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 40),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18)]
        }
        
        logoutButton.constraint { view in
            [view.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
             view.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
             view.heightAnchor.constraint(equalToConstant: 27),
             view.widthAnchor.constraint(equalToConstant: 27)]
        }
        
        accountView.constraint { view in
            [view.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 28),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18)]
        }
        
        balanceView.constraint { view in
            [view.topAnchor.constraint(equalTo: accountView.bottomAnchor, constant: 21),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
             view.bottomAnchor.constraint(equalTo: topPortionContainer.bottomAnchor, constant: -16)]
        }
        
        recentLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topPortionContainer.bottomAnchor, constant: 15),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18)]
        }
        
        statementTableView.constraint { view in
            [view.topAnchor.constraint(equalTo: recentLabel.bottomAnchor, constant: 15),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             view.bottomAnchor.constraint(equalTo: bottomAnchor)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = AppColors.custom.whiteBackground
    }
}
