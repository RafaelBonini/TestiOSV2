//
//  Statement.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 25/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

struct StatementsModel: Codable {
  var statementList: [Statements]?
  var error: ResponseError?
}

struct Statements: Codable {
  var title: String?
  var desc: String?
  var date: String?
  var value: Float?
}
