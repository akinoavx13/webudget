//
//  Translator+Extensions.swift
//  
//
//  Created by Maxime Maheo on 03/05/2022.
//

import Core

extension Translator {
    
    // MARK: - Properties
    
    static let name = Translator.string(key: "name", bundle: .module)
    static let save = Translator.string(key: "save", bundle: .module)
    
    // MARK: - Methods
    
    static func xTransactions(value: Int) -> String {
        String(format: Translator.string(key: "x_transactions", bundle: .module), value)
    }
}
