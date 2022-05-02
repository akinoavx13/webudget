//
//  Translator+Extensions.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import Core

extension Translator {
    static let transaction = Translator.string(key: "transaction", bundle: .module)
    static let expense = Translator.string(key: "expense", bundle: .module)
    static let income = Translator.string(key: "income", bundle: .module)
}
