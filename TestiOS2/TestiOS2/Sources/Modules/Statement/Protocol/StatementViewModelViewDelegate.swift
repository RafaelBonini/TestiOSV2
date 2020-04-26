//
//  StatementViewModelViewDelegate.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

protocol StatementViewModelViewDelegate: class {
    func reloadTableView()
    func startloading()
    func stoploading()
}
