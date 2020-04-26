//
//  String+Extensions.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 26/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let format = "dd/MM/yyyy"
        let dFormatter = DateFormatter()
        dFormatter.calendar = Calendar(identifier: .gregorian)
        dFormatter.dateFormat = format
        let date = dFormatter.date(from: self)
        let stringDate = dFormatter.string(from: date ?? Date())
        
        return stringDate
    }
}
