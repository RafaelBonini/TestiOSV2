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
    
    private lazy var topPortionContainer: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.custom.strongBlue
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultLightFontWithSize(size: 25)
        label.textColor = .white
        label.text = self.viewModel.user.name
        
        return label
    }()
    
    private lazy var logoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logout_icon()
        
        return imageView
    }()
    
    private lazy var accountView: StatementTitleValueView = {
        let view = StatementTitleValueView(
            title: R.string.localizable.statementAccountLabel(),
            value: self.viewModel.buildAccount()
        )
        
        return view
    }()
    
    private lazy var balanceView: StatementTitleValueView = {
        let view = StatementTitleValueView(
            title: R.string.localizable.statementBalanceLabel(),
            value: self.viewModel.user.balance?.currencyFormatter() ?? ""
        )
        
        return view
    }()
    
    private lazy var recentLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultRegularFontWithSize(size: 17)
        label.textColor = AppColors.custom.darkGray
        label.text = R.string.localizable.statementRecentLabel()
        
        return label
    }()
    
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
        addSubview(topPortionContainer)
        
        topPortionContainer.addSubview(nameLabel)
        topPortionContainer.addSubview(logoutImageView)
        topPortionContainer.addSubview(accountView)
        topPortionContainer.addSubview(balanceView)
        
        addSubview(recentLabel)
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
        
        logoutImageView.constraint { view in
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
    }
    
    func additionalSetup() {
        backgroundColor = AppColors.custom.whiteBackground
    }
}
