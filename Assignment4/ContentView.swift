//
//  ContentView.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/17/24.
//
import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var budgetViewModel = BudgetViewModel()
    @StateObject var expensesViewModel = ExpensesViewModel(budgetViewModel: BudgetViewModel())
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel

    var body: some View {
        NavigationView {
            Group {
                if authenticationViewModel.isAuthenticated {
                    TabView {
                        BudgetsView(budgetViewModel: budgetViewModel)
                            .tabItem {
                                Label("Budgets", systemImage: "folder")
                            }
                        ExpensesView(expensesViewModel: expensesViewModel)
                            .tabItem {
                                Label("Expenses", systemImage: "creditcard.fill")
                            }
                    }
                    .onAppear {
                        expensesViewModel.budgetViewModel = budgetViewModel
                    }
                } else {
                    SignInView()
                        .environmentObject(authenticationViewModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if authenticationViewModel.isAuthenticated {
                        Button("Logout") {
                            authenticationViewModel.signOut()
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
            .navigationBarTitle("Wealth Wielder")
        }
    }
}

