//
//  BudgetService.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import DatabaseService
import Model
import Core
import Foundation.NSUUID

public protocol BudgetServiceProtocol {
    func save(transaction: Transaction)
    func fetchTransactions() -> [Transaction]
    func delete(transactions: [Transaction])
    
    func save(tag: Tag)
    func fetchTags() -> [Tag]
    func fetchTag(uuid: UUID) -> Tag?
    func createOrUpdateTag(tag: Tag)
    func delete(tags: [Tag])
}

public final class BudgetService: BudgetServiceProtocol {
    
    // MARK: - Properties
    
    private let databaseService: DatabaseServiceProtocol
    
    // MARK: - Lifecycle
    
    public init(databaseService: DatabaseServiceProtocol = DatabaseService()) {
        self.databaseService = databaseService
    }
    
    // MARK: - Methods
    
    public func save(transaction: Transaction) { databaseService.save(transaction: transaction) }
    public func fetchTransactions() -> [Transaction] { databaseService.fetchTransactions() }
    public func delete(transactions: [Transaction]) { databaseService.delete(transactions: transactions) }
    
    public func save(tag: Tag) { databaseService.save(tag: tag) }
    
    public func fetchTags() -> [Tag] {
        let tags = databaseService.fetchTags()
        
        if tags.isEmpty {
            save(tag: Tag(name: Translator.groceries))
            save(tag: Tag(name: Translator.transit))
            
            return databaseService.fetchTags()
        }
        
        return tags
    }
    
    public func fetchTag(uuid: UUID) -> Tag? { databaseService.fetchTag(uuid: uuid) }
    
    public func createOrUpdateTag(tag: Tag) { databaseService.createOrUpdateTag(tag: tag) }
    
    public func delete(tags: [Tag]) { databaseService.delete(tags: tags) }
}

#if DEBUG

extension BudgetService {
    public static let preview: BudgetServiceProtocol = BudgetService(databaseService: DatabaseServiceMock())
}

#endif
