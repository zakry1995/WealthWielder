//
//  BudgetViewModel.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/23/24.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var categories: [BudgetCategory]
    
    init() {
       
        categories = [
            BudgetCategory(name: "Rent", allocatedAmount: 1000, amountSpent: 0),
            BudgetCategory(name: "Groceries", allocatedAmount: 500, amountSpent: 0),
            BudgetCategory(name: "Utilities", allocatedAmount: 300, amountSpent: 0),
            BudgetCategory(name: "Transportation", allocatedAmount: 200, amountSpent: 0),
            BudgetCategory(name: "Healthcare", allocatedAmount: 200, amountSpent: 0),
            BudgetCategory(name: "Insurance", allocatedAmount: 100, amountSpent: 0),
            BudgetCategory(name: "Debt Payments", allocatedAmount: 300, amountSpent: 0),
            BudgetCategory(name: "Savings", allocatedAmount: 800, amountSpent: 0),
            BudgetCategory(name: "Personal Spending", allocatedAmount: 400, amountSpent: 0),
            BudgetCategory(name: "Education", allocatedAmount: 200, amountSpent: 0),
            BudgetCategory(name: "Childcare", allocatedAmount: 300, amountSpent: 0),
            BudgetCategory(name: "Gifts/Donations", allocatedAmount: 100, amountSpent: 0),
            BudgetCategory(name: "Miscellaneous", allocatedAmount: 100, amountSpent: 0)
        ]
    }
    
    func updateCategoryAmount(categoryId: UUID, newAmount: Double) {
          guard let categoryIndex = categories.firstIndex(where: { $0.id == categoryId }) else {
              return
          }
          categories[categoryIndex].allocatedAmount = newAmount
      }
      
      func addExpense(to categoryName: String, amount: Double) {
          guard let categoryIndex = categories.firstIndex(where: { $0.name == categoryName }) else {
              return
          }
          categories[categoryIndex].amountSpent += amount
      }
      
      func reduceSpentAmount(from categoryName: String, amount: Double) {
          guard let categoryIndex = categories.firstIndex(where: { $0.name == categoryName }) else {
              return
          }
          categories[categoryIndex].amountSpent -= amount
          categories[categoryIndex].amountSpent = max(0, categories[categoryIndex].amountSpent)
      }
  }
