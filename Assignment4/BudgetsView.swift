//
//  BudgetsView.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/24/24.
//
import SwiftUI

struct BudgetsView: View {
    @ObservedObject var budgetViewModel: BudgetViewModel
    
    var totalBudget: Double {
        budgetViewModel.categories.reduce(0) { $0 + $1.allocatedAmount }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(budgetViewModel.categories) { category in
                    HStack {
                        Text(category.name)
                        Spacer()
                        TextField("Allocated Amount", text: Binding(
                            get: {
                                String(format: "%.2f", category.allocatedAmount)
                            },
                            set: { newValue in
                                if let newAmount = Double(newValue) {
                                    budgetViewModel.updateCategoryAmount(categoryId: category.id, newAmount: newAmount)
                                }
                            }
                        ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        
                        VStack {
                            Menu {
                                Text("Amount Spent: \(String(format: "%.2f", category.amountSpent))")
                                Text("Amount Left: \(String(format: "%.2f", category.allocatedAmount - category.amountSpent))")
                            } label: {
                                Image(systemName: "ellipsis")
                                    .padding(.horizontal)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
            }
            
            Text("Total Budget: \(totalBudget, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

