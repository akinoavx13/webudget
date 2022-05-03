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
    public let value: Int
    public let date: Date
    public let isExpense: Bool
    public let tag: Tag?
    
    // MARK: - Lifecycle
    
    public init(value: Int,
                isExpense: Bool = true,
                id: UUID = UUID(),
                date: Date = Date(),
                tag: Tag? = nil) {
        self.id = id
        self.value = value
        self.date = date
        self.isExpense = isExpense
        self.tag = tag
    }
}
