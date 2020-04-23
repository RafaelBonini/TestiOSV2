//
//  Error.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

struct ResponseError: Codable {
  let code: Int?
  let message: String?
}
