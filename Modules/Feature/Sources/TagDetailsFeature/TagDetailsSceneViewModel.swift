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

protocol TagDetailsSceneViewModelDelegate: AnyObject {
    func tagDetailsSceneViewModel(_ sender: TagDetailsSceneViewModel,
                                  tagDidSave tag: Tag)
    func tagDetailsSceneViewModel(_ sender: TagDetailsSceneViewModel,
                                  tagDidDelete tag: Tag)
}

@MainActor
final class TagDetailsSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: TagDetailsSceneCoordinator?
    weak var delegate: TagDetailsSceneViewModelDelegate?
    
    @Published var tagName: String = ""
    @Published private(set) var transactionsCount: Int = 0

    private var tag: Tag?
    private let id: UUID?
    
    private let budgetService: BudgetServiceProtocol
    
    // MARK: - Lifecycle
    
    init(budgetService: BudgetServiceProtocol,
         id: UUID?) {
        self.budgetService = budgetService
        self.id = id
    }
    
    // MARK: - Methods
    
    func fetchTag() {
        if let id = id {
            tag = budgetService.fetchTag(uuid: id)
        } else {
            tag = Tag()
        }
        
        tagName = tag?.name ?? ""
        transactionsCount = tag?.transactionsCount ?? 0
    }
    
    func save() {
        if var tag = tag {
            tag.name = tagName
            
            budgetService.createOrUpdateTag(tag: tag)
            delegate?.tagDetailsSceneViewModel(self, tagDidSave: tag)
        }
        
        coordinator?.stop()
    }
    
    func delete() {
        if let tag = tag {
            
            budgetService.delete(tags: [tag])
            delegate?.tagDetailsSceneViewModel(self, tagDidDelete: tag)
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
