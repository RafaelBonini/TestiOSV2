//
//  KeychainSwift+Extensions.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

enum KeychainKeys: String {
    case emailOrCpf = "emailOrCpf"
}

extension KeychainSwift: Storage {
    func set(_ value: Data, forKey key: KeychainKeys) {
        set(value, forKey: key.rawValue, withAccess: nil)
    }
    
    func getData(_ key: KeychainKeys) -> Data? {
        return getData(key.rawValue)
    }
    
    func getData(_ key: String) -> Data? {
        return getData(key, asReference: false)
    }

    func set(_ value: Data, forKey key: String) -> Bool {
        return set(value, forKey: key, withAccess: nil)
    }

    func clearData() {
        _ = clear()
    }
}
