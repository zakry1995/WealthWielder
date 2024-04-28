//
//  BudgetCategory.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/24/24.
//
import Foundation

struct BudgetCategory: Identifiable {
    let id = UUID()
    var name: String
    var allocatedAmount: Double
    var amountSpent: Double
}
