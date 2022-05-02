//
//  Tag+Extensions.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import Model
import Foundation.NSUUID

extension Tag {
    
    // MARK: - Lifecycle
    
    init?(tag: CDTag) {
        guard let value = tag.value,
              let id = tag.id
        else { return nil }
        
        self.init(value: value,
                  id: id)
    }
}
