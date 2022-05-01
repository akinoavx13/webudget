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
    func formatDate(value: Date,
                    format: String) -> String
}

public final class FormatterService: FormatterServiceProtocol {
    
    // MARK: - Properties

    private let numberFormatter: NumberFormatter
    private let dateFormatter: DateFormatter

    // MARK: - Lifecycle

    public init(numberFormatter: NumberFormatter = NumberFormatter(),
                dateFormatter: DateFormatter = DateFormatter()) {
        self.numberFormatter = numberFormatter
        self.numberFormatter.locale = .current
        self.numberFormatter.numberStyle = .currency
        self.numberFormatter.minimumFractionDigits = 0
        
        self.dateFormatter = dateFormatter
        self.dateFormatter.locale = .current
    }

    // MARK: - Methods

    public func formatCurrency(value: Int) -> String {
        numberFormatter.string(from: value as NSNumber) ?? "0"
    }
    
    public func formatCurrency(value: String) -> Int {
        numberFormatter.number(from: value)?.intValue ?? 0
    }
    
    public func formatDate(value: Date,
                           format: String) -> String {
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: value)
    }
}
