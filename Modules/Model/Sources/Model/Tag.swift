//
//  Tag.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import Foundation.NSDate

public struct Tag {
    
    // MARK: - Properties
    
    public let id: UUID
    public let name: String
    public let transactionsCount: Int

    // MARK: - Lifecycle
    
    public init(name: String,
                id: UUID = UUID(),
                transactionsCount: Int? = nil) {
        self.id = id
        self.name = name
        self.transactionsCount = transactionsCount ?? 0
    }
}
