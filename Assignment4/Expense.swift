//
//  File.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/23/24.
//

import Foundation

struct Expense: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
    let date: Date
}


