//
//  TagListSceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 02/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import BudgetService
import Foundation
import Model

@MainActor
final class TagListSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: TagListSceneCoordinator?
    
    @Published private(set) var models: [TagComponent.Model] = []
    
    private var tags: [Tag] = []
    
    private let budgetService: BudgetServiceProtocol

    // MARK: - Lifecycle
    
    init(budgetService: BudgetServiceProtocol) {
        self.budgetService = budgetService
    }
    
    // MARK: - Methods
    
    func fetchTags() {
        tags = budgetService .fetchTags()
        models = tags
            .map { TagComponent.Model(id: $0.id,
                                      title: $0.value) }
    }
    
    func delete(at offsets: IndexSet) {
        budgetService.delete(tags: offsets.map { tags[$0] })

        fetchTags()
    }
}

#if DEBUG

extension TagListSceneViewModel {
    static let preview = TagListSceneViewModel(budgetService: BudgetService.preview)
}

#endif
