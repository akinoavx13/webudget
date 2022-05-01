//
//  Translator.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import Foundation

public struct Translator {
    public static func string(key: String,
                              bundle: Bundle) -> String {
        NSLocalizedString(key,
                          bundle: bundle,
                          comment: "")
    }
}
