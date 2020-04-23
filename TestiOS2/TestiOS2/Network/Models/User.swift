//
//  User.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

struct LoginModel: Codable {
  let userAccount: UserAccount?
  let error: ResponseError?
}

struct UserAccount: Codable {
  let userId: Int?
  let name: String?
  let bankAccount: String?
  let agency: String?
  let balance: Float?
}
