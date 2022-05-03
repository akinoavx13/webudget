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
                    dateStyle: DateFormatter.Style,
                    timeStyle: DateFormatter.Style) -> String
    func formatDate(value: Date,
                    format: String) -> String
}

public final class FormatterService: FormatterServiceProtocol {
    
    // MARK: - Properties

    private let numberFormatter: NumberFormatter
    private let dateStyleFormatter: DateFormatter
    private let dateFormatFormatter: DateFormatter

    // MARK: - Lifecycle

    public init(numberFormatter: NumberFormatter = NumberFormatter(),
                dateStyleFormatter: DateFormatter = DateFormatter(),
                dateFormatFormatter: DateFormatter = DateFormatter()) {
        self.numberFormatter = numberFormatter
        self.numberFormatter.locale = .current
        self.numberFormatter.numberStyle = .currency
        self.numberFormatter.minimumFractionDigits = 0
        
        self.dateStyleFormatter = dateStyleFormatter
        self.dateStyleFormatter.locale = .current
        
        self.dateFormatFormatter = dateFormatFormatter
        self.dateFormatFormatter.locale = .current
    }

    // MARK: - Methods

    public func formatCurrency(value: Int) -> String {
        numberFormatter.string(from: value as NSNumber) ?? "0"
    }
    
    public func formatCurrency(value: String) -> Int {
        numberFormatter.number(from: value)?.intValue ?? 0
    }
    
    public func formatDate(value: Date,
                           dateStyle: DateFormatter.Style,
                           timeStyle: DateFormatter.Style) -> String {
        dateStyleFormatter.dateStyle = dateStyle
        dateStyleFormatter.timeStyle = timeStyle
        
        return dateStyleFormatter.string(from: value)
    }
    
    public func formatDate(value: Date,
                           format: String) -> String {
        dateFormatFormatter.dateFormat = format
        
        return dateFormatFormatter.string(from: value)
    }
}
