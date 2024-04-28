//
//  DateFormatter.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/23/24.
//

import Foundation

extension DateFormatter {
    static let monthAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy" 
        return formatter
    }()
}
