//
//  File.swift
//  
//
//  Created by Maxime Maheo on 27/04/2022.
//

import Foundation.NSLocale

extension Locale {
    public static func language(preferredLanguages: String? = Locale.preferredLanguages.first) -> String {
        let languageIdentifier = preferredLanguages ?? "en-US"
        let languageDic = Locale.components(fromIdentifier: languageIdentifier)

        return languageDic["kCFLocaleLanguageCodeKey"] ?? "en"
    }
}
