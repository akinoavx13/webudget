//
//  Transaction.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import Foundation.NSDate

public struct Transaction: Identifiable {
    
    // MARK: - Properties
    
    public let id: UUID
    public let value: Int
    public let date: Date
    
    // MARK: - Lifecycle
    
    public init(value: Int,
                id: UUID = UUID(),
                date: Date = Date()) {
        self.value = value
        self.id = id
        self.date = date
    }
}
