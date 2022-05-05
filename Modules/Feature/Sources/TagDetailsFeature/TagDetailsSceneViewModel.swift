//
//  TagDetailsSceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 03/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import BudgetService
import Model
import Foundation.NSUUID

@MainActor
final class TagDetailsSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: TagDetailsSceneCoordinator?
 
    @Published var tagName: String = ""
    @Published private(set) var transactionsCount: Int = 0

    private var tag: Tag?
    private let id: UUID
    
    private let budgetService: BudgetServiceProtocol
    
    // MARK: - Lifecycle
    
    init(budgetService: BudgetServiceProtocol,
         id: UUID) {
        self.budgetService = budgetService
        self.id = id
    }
    
    // MARK: - Methods
    
    func fetchTag() {
        tag = budgetService.fetchTag(uuid: id)
        
        tagName = tag?.name ?? ""
        transactionsCount = tag?.transactionsCount ?? 0
    }
    
    func save() {
        if var tag = tag {
            tag.name = tagName
            
            budgetService.updateTag(tag: tag)
        }
        
        coordinator?.stop()
    }
    
    func delete() {
        if let tag = tag {
            budgetService.delete(tags: [tag])
        }
        
        coordinator?.stop()
    }
    
    func cancel() {
        coordinator?.stop()
    }
}

#if DEBUG

extension TagDetailsSceneViewModel {
    static let preview = TagDetailsSceneViewModel(budgetService: BudgetService.preview,
                                                  id: UUID())
}

#endif
