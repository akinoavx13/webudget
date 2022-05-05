//
//  Tag.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import Foundation.NSDate

public struct Tag {
    
    // MARK: - Properties
    
    public var id: UUID
    public var name: String
    public var transactionsCount: Int

    // MARK: - Lifecycle
    
    public init(name: String,
                id: UUID = UUID(),
                transactionsCount: Int? = nil) {
        self.id = id
        self.name = name
        self.transactionsCount = transactionsCount ?? 0
    }
}
