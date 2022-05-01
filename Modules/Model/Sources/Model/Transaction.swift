//
//  Transaction.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import Foundation.NSDate

public struct Transaction {
    
    // MARK: - Properties
    
    public let value: Int
    public let date: Date
    
    // MARK: - Lifecycle
    
    public init(value: Int,
                date: Date = Date()) {
        self.value = value
        self.date = date
    }
}
