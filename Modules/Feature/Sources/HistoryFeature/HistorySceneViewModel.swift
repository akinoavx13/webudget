//
//  HistorySceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 01/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import Model
import Foundation.NSUUID
import BudgetService
import Core

final class HistorySceneViewModel: ObservableObject {
    
    struct Section: Identifiable {
        let id = UUID()
        let title: String
        let transactions: [Transaction]
    }
    
    // MARK: - Properties
    
    weak var coordinator: HistorySceneCoordinator?
    
    @Published private(set) var sections: [Section] = []
    
    private let budgetService: BudgetServiceProtocol
    
    // MARK: - Lifecycle
    
    init(budgetService: BudgetServiceProtocol) {
        self.budgetService = budgetService
    }
    
    // MARK: - Methods
    
    func fetchTransactions() {
        sections = [Section(title: "ok",
                            transactions: budgetService.fetchTransactions())]
    }
    
    func delete(at offsets: IndexSet,
                sectionId: UUID) {
        guard let section = sections.first(where: { $0.id == sectionId }) else { return }
        
        var transactionsToDelete: [Transaction] = []
        
        for offset in offsets {
            transactionsToDelete.append(section.transactions[offset])
        }
        
        budgetService.delete(transactions: transactionsToDelete)
        fetchTransactions()
    }
}

#if DEBUG

extension HistorySceneViewModel {
    static let preview = HistorySceneViewModel(budgetService: BudgetService())
}

#endif
