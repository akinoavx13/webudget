//
//  Transaction.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import Foundation.NSDate

public struct Transaction {
    
    // MARK: - Properties
    
    public let id: UUID
    public let amount: Int
    public let date: Date
    public let isExpense: Bool
    public let tag: Tag?
    
    // MARK: - Lifecycle
    
    public init(amount: Int,
                isExpense: Bool = true,
                id: UUID = UUID(),
                date: Date = Date(),
                tag: Tag? = nil) {
        self.id = id
        self.amount = amount
        self.date = date
        self.isExpense = isExpense
        self.tag = tag
    }
}
