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
                  isExpense: transaction.isExpense,
                  id: transaction.id ?? UUID(),
                  date: transaction.date ?? Date())
    }
}
