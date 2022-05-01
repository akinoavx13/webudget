//
//  BudgetService.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import DatabaseService
import Model

public protocol BudgetServiceProtocol {
    func save(transaction: Transaction)
    func fetchTransactions() -> [Transaction]
}

public final class BudgetService: BudgetServiceProtocol {
    
    // MARK: - Properties
    
    private let databaseService: DatabaseServiceProtocol
    
    // MARK: - Lifecycle
    
    public init(databaseService: DatabaseServiceProtocol = DatabaseService()) {
        self.databaseService = databaseService
    }
    
    // MARK: - Methods
    
    public func save(transaction: Transaction) {
        databaseService.save(transaction: transaction)
    }
    
    public func fetchTransactions() -> [Transaction] {
        databaseService.fetchTransactions()
    }
}
