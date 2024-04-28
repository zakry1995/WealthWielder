//
//  HomeView.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/17/24.
//
import SwiftUI



struct HomeView: View {
    @StateObject var budgetViewModel = BudgetViewModel()
    @StateObject var expensesViewModel = ExpensesViewModel(budgetViewModel: BudgetViewModel())

    var body: some View {
        TabView {
            BudgetsView(budgetViewModel: budgetViewModel)
                .tabItem {
                    Label("Budgets", systemImage: "wallet.pass")
                }
            ExpensesView(expensesViewModel: expensesViewModel)
                .tabItem {
                    Label("Expenses", systemImage: "creditcard")
                }
        }
    }
}




