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
    
    init?(transaction: CDTransaction) {
        guard let id = transaction.id,
                let date = transaction.date
        else { return nil }
        
        self.init(value: Int(transaction.value),
                  isExpense: transaction.isExpense,
                  id: id,
                  date: date)
    }
}
