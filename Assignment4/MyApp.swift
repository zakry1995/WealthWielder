//
//  MyApp.swift
//  Assignment4
//
//  Created by Ansley Ellen Davis on 4/17/24.
//

import SwiftUI
import Firebase

@main
struct MyApp: App {
    @StateObject var budgetViewModel = BudgetViewModel()
    @StateObject var expensesViewModel = ExpensesViewModel(budgetViewModel: BudgetViewModel())
    @StateObject var authenticationViewModel = AuthenticationViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authenticationViewModel)
                .environmentObject(budgetViewModel)
                .environmentObject(expensesViewModel)
        }
    }
}





