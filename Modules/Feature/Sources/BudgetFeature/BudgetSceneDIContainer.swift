//
//  BudgetSceneDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 05/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController

public final class BudgetSceneDIContainer {
    
    public struct Dependencies {

        // MARK: - Lifecycle

        public init() { }
    }
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Lifecycle
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    public func makeCoordinator(navigationController: UINavigationController) -> BudgetSceneCoordinator {
        BudgetSceneCoordinator(navigationController: navigationController,
                               dependencies: self)
    }
}

// MARK: - BudgetSceneCoordinatorDependencies -

extension BudgetSceneDIContainer: BudgetSceneCoordinatorDependencies { }
