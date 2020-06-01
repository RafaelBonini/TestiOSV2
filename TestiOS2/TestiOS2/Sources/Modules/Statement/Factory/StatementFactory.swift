//
//  StatementFactory.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

final class StatementFactory {
    private let state: StatementFactoryState

    init(state: StatementFactoryState) {
        self.state = state
    }

    func make() -> [TableViewSection] {
        return [StaticSection(cellBuilders: buildersForState())]
    }

    private func buildersForState() -> [TableViewCellBuilder] {
        switch state {
        case let .success(items):
            return itemsBuilders(items)
        case .loading:
            return []
        case .error:
            return []
        }
    }

    private func itemsBuilders(_ items: [Statements]) -> [TableViewCellBuilder] {
        return items.map { StatementCellBuilder(item: $0) }
    }
}
