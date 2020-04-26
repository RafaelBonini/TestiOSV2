//
//  StatementCellBuilder.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

final class StatementCellBuilder {

    private let item: Statements

    init(item: Statements) {
        self.item = item
    }
}

extension StatementCellBuilder: TableViewCellBuilder {
    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(StatementTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: StatementTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(
            title: item.title ?? "",
            desc: item.desc ?? "",
            date: item.date?.formattedDate() ?? "",
            value: item.value ?? 0.0
        )

        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
}

