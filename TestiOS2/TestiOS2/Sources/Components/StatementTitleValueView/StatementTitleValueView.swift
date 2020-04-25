//
//  StatementTitleValueView.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 24/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

class StatementTitleValueView: UIView {
    
    let title: String
    let value: String
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultRegularFontWithSize(size: 12)
        label.textColor = .white
        label.textAlignment = .left
        label.text = self.title
        
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.defaultLightFontWithSize(size: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.text = self.value
        
        return label
    }()
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatementTitleValueView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
    func setupConstraints() {
        
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor)]
        }
        
        valueLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor)]
        }
    }
}
