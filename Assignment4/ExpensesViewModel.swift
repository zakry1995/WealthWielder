//
//  ExpenseViewModel.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/23/24.
//

import Foundation
import Combine

class ExpensesViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    var budgetViewModel: BudgetViewModel
    
    init(budgetViewModel: BudgetViewModel) {
        self.budgetViewModel = budgetViewModel
    }
    
    func addExpense(category: String, amount: Double, date: Date = Date()) {
        let newExpense = Expense(category: category, amount: amount, date: date)
        expenses.append(newExpense)
        budgetViewModel.addExpense(to: category, amount: amount)
    }
    
    func removeExpense(expenseId: UUID) {
        if let index = expenses.firstIndex(where: { $0.id == expenseId }) {
            let expense = expenses.remove(at: index)
            budgetViewModel.reduceSpentAmount(from: expense.category, amount: expense.amount)
        }
    }
}
