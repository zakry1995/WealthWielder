//
//  ExpensesView.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/24/24.
//

import Foundation
import SwiftUI

struct ExpensesView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    @State private var amountText = ""
    @State private var selectedCategoryIndex = 0
    private var categories: [String] {
        expensesViewModel.budgetViewModel.categories.map { $0.name }
    }
    
    var body: some View {
        VStack {
            Picker("Category", selection: $selectedCategoryIndex) {
                ForEach(0..<categories.count, id: \.self) { index in
                    Text(categories[index]).tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            TextField("Amount", text: $amountText)
                .keyboardType(.decimalPad)
                .padding()
            
            Button("Add Expense") {
                if let amount = Double(amountText), selectedCategoryIndex < categories.count {
                    let selectedCategory = categories[selectedCategoryIndex]
                    expensesViewModel.addExpense(category: selectedCategory, amount: amount)
                    amountText = ""
                }
            }
            .padding()
            
            Text("Selected Category: \(categories[selectedCategoryIndex])")
                .padding(.bottom)
            
            List {
                ForEach(expensesViewModel.expenses) { expense in
                    HStack {
                        Text("\(expense.category): \(String(format: "%.2f", expense.amount))")
                        Spacer()
                        Button(action: {
                            expensesViewModel.removeExpense(expenseId: expense.id)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
}
