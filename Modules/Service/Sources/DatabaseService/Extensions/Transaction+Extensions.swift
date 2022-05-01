//
//  Transaction+Extensions.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import Model
import Foundation.NSDate

extension Transaction {
    
    // MARK: - Lifecycle
    
    init(transaction: CDTransaction) {
        self.init(value: Int(transaction.value),
                  date: transaction.date ?? Date())
    }
}
