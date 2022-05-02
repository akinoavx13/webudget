//
//  DatabaseServiceMock.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import Model
import Foundation.NSDate

public final class DatabaseServiceMock: DatabaseServiceProtocol {
    
    // MARK: - Lifecycle
    
    public init() { }
    
    // MARK: - Methods
    
    public func save(transaction: Transaction) { }
    public func fetchTransactions() -> [Transaction] { [Transaction(value: 1250,
                                                                    isExpense: true,
                                                                    id: UUID(),
                                                                    date: Date()),
                                                        Transaction(value: 250,
                                                                    isExpense: true,
                                                                    id: UUID(),
                                                                    date: Date()),
                                                        Transaction(value: 10,
                                                                    isExpense: false,
                                                                    id: UUID(),
                                                                    date: Date())] }
    public func delete(transactions: [Transaction]) { }
    
    public func save(tag: Tag) { }
    public func fetchTags() -> [Tag] { [Tag(value: "Groceries 🛒",
                                            id: UUID())] }
    public func delete(tags: [Tag]) { }
}
