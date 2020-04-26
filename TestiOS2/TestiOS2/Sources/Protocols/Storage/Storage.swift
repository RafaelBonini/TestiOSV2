//
//  Storage.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

protocol Storage {
    func set(_ value: Data, forKey key: KeychainKeys)
    func getData(_ key: KeychainKeys) -> Data?
    func clearData()
}
