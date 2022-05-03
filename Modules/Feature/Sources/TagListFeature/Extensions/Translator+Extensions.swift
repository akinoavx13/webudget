//
//  Translator+Extensions.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import Core

extension Translator {
    
    // MARK: - Properties
    
    static let tags = Translator.string(key: "tags", bundle: .module)
    
    // MARK: - Methods
    
    static func xTransactions(value: Int) -> String {
        String(format: Translator.string(key: "x_transactions", bundle: .module), value)
    }
}
