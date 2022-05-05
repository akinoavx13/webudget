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
import FormatterService

@MainActor
final class HistorySceneViewModel: ObservableObject {
    
    struct Section: Identifiable {
        let id = UUID()
        let title: String
        let models: [TransactionComponent.Model]
    }
    
    // MARK: - Properties
    
    weak var coordinator: HistorySceneCoordinator?
    
    @Published private(set) var sections: [Section] = []
    
    private var transactions: [Transaction] = []
    
    private let budgetService: BudgetServiceProtocol
    private let formatterService: FormatterServiceProtocol
    
    // MARK: - Lifecycle
    
    init(budgetService: BudgetServiceProtocol,
         formatterService: FormatterServiceProtocol) {
        self.budgetService = budgetService
        self.formatterService = formatterService
    }
    
    // MARK: - Methods
    
    func fetchTransactions() {
        transactions = budgetService.fetchTransactions()
        
        var sections: [String: [Transaction]] = [:]
        transactions
            .forEach { transaction in
                let key = formatterService.formatDate(value: transaction.date, format: "MMM")
                
                if sections[key] == nil {
                    sections[key] = []
                    sections[key]?.append(transaction)
                } else {
                    sections[key]?.append(transaction)
                }
            }
        
        self.sections = sections
            .map { iterator in
                Section(title: iterator.key,
                        models: iterator.value.map { TransactionComponent.Model(id: $0.id,
                                                                                amount: formatterService.formatCurrency(value: $0.amount),
                                                                                date: formatterService.formatDate(value: $0.date,
                                                                                                                  dateStyle: .medium,
                                                                                                                  timeStyle: .none),
                                                                                isExpense: $0.isExpense,
                                                                                tagName: $0.tag?.name)})
            }
    }
    
    func delete(at offsets: IndexSet,
                sectionId: UUID) {
        guard let section = sections.first(where: { $0.id == sectionId }) else { return }
        
        let transactionsIdToDelete: [UUID] = offsets.map { section.models[$0].id }
        let transactionsToDelete: [Transaction] = transactions
            .filter { transaction in
                transactionsIdToDelete.contains(where: { $0 == transaction.id })
            }
        
        budgetService.delete(transactions: transactionsToDelete)
        fetchTransactions()
    }
}

#if DEBUG

extension HistorySceneViewModel {
    static let preview = HistorySceneViewModel(budgetService: BudgetService.preview,
                                               formatterService: FormatterService())
}

#endif
