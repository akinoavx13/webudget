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
    static let cancel = Translator.string(key: "cancel", bundle: .module)
    static let delete = Translator.string(key: "delete", bundle: .module)
    
    // MARK: - Methods
    
    static func xTransactions(value: Int) -> String {
        String(format: Translator.string(key: "x_transactions", bundle: .module), value)
    }
}
