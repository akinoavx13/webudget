//
//  Tag.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import Foundation.NSDate

public struct Tag: Identifiable {
    
    // MARK: - Properties
    
    public let id: UUID
    public let value: String
    
    // MARK: - Lifecycle
    
    public init(value: String,
                id: UUID = UUID()) {
        self.id = id
        self.value = value
    }
}
