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
    
    init?(tag: CDTag?) {
        guard let name = tag?.name,
              let id = tag?.id
        else { return nil }
        
        self.init(name: name,
                  id: id,
                  transactionsCount: tag?.transactions?.count)
    }
}
