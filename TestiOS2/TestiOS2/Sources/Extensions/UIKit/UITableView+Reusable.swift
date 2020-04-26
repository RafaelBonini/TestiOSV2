//
//  UITableView+Reusable.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func dequeueReusableCell<T: UITableViewCell & Identifiable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError(
                "Cell is not registered - call tableView.register(Cell.Type) to register first before using."
            )
        }
        
        return cell
    }
    
    func registerNib<T: UITableViewCell & Identifiable>(_: T.Type = T.self) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.identifier)
    }
    
    func register<T: UITableViewCell & Identifiable>(_: T.Type = T.self) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
}

