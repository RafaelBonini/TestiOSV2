//
//  StatementTableViewCell.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

final class StatementTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultRegularFontWithSize(size: 16)
        label.textColor = AppColors.custom.placeHolderlightBlue
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultRegularFontWithSize(size: 12)
        label.textColor = AppColors.custom.placeHolderlightBlue
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultRegularFontWithSize(size: 16)
        label.textColor = AppColors.custom.darkGrey
        
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultLightFontWithSize(size: 20)
        label.textColor = AppColors.custom.darkGrey
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.borderColor = AppColors.custom.grey30Alpha.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        
        
        return view
    }()
    
    func configure(title: String,
                   desc: String,
                   date: String,
                   value: Float) {
                
        self.titleLabel.text = title
        self.descLabel.text = desc
        self.dateLabel.text = date
        self.valueLabel.text = value.currencyFormatter() ?? ""
    }
}

extension StatementTableViewCell: Identifiable { }

extension StatementTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(descLabel)
        containerView.addSubview(valueLabel)
        
        contentView.addSubview(containerView)
    }
    
    func setupConstraints() {
        
        containerView.constraint { view in
            [view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)]
        }
        
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 11),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 13)]
        }
        
        dateLabel.constraint { view in
            [view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
             view.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
             view.widthAnchor.constraint(equalToConstant: 90)]
        }
        
        descLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19),
             view.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
             view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)]
        }
        
        valueLabel.constraint { view in
            [view.bottomAnchor.constraint(equalTo: descLabel.bottomAnchor),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)]
        }
        

    }
    
    func additionalSetup() {
        backgroundColor = .clear
    }
}
