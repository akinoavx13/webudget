//
//  TagDetailsSceneDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 03/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import BudgetService

public final class TagDetailsSceneDIContainer {
    
    public struct Dependencies {

        // MARK: - Properties
        
        let budgetService: BudgetServiceProtocol
        
        // MARK: - Lifecycle

        public init(budgetService: BudgetServiceProtocol) {
            self.budgetService = budgetService
        }
    }
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Lifecycle
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    public func makeCoordinator(navigationController: UINavigationController) -> TagDetailsSceneCoordinator {
        TagDetailsSceneCoordinator(navigationController: navigationController,
                                   dependencies: self)
    }
}

// MARK: - TagDetailsSceneCoordinatorDependencies -

extension TagDetailsSceneDIContainer: TagDetailsSceneCoordinatorDependencies {
    
    // MARK: - Properties
    
    var budgetService: BudgetServiceProtocol { dependencies.budgetService }
    
}
