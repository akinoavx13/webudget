//
//  FormatterService.swift
//
//
//  Created by Maxime Maheo on 29/04/2022.
//

import Foundation

public protocol FormatterServiceProtocol {
    func formatCurrency(value: Int) -> String
    func formatCurrency(value: String) -> Int
}

public final class FormatterService: FormatterServiceProtocol {
    
    // MARK: - Properties

    private let numberFormatter: NumberFormatter

    // MARK: - Lifecycle

    public init(numberFormatter: NumberFormatter = NumberFormatter()) {
        self.numberFormatter = numberFormatter
        self.numberFormatter.locale = Locale.current
        self.numberFormatter.numberStyle = .currency
        self.numberFormatter.minimumFractionDigits = 0
    }

    // MARK: - Methods

    public func formatCurrency(value: Int) -> String {
        numberFormatter.string(from: value as NSNumber) ?? "0"
    }
    
    public func formatCurrency(value: String) -> Int {
        numberFormatter.number(from: value)?.intValue ?? 0
    }
}
