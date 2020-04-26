//
//  TableViewCellBuilder.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

protocol TableViewCellBuilder {

    var cellHeight: CGFloat { get }

    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)
}

extension TableViewCellBuilder {
    func tableViewDidSelectCell(_ tableView: UITableView) { }
}
