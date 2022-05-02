//
//  EditTagSceneDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 02/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import BudgetService

public final class EditTagSceneDIContainer {
    
    public struct Dependencies {

        // MARK: - Properties
        
        var budetService: BudgetServiceProtocol
        
        // MARK: - Lifecycle

        public init(budetService: BudgetServiceProtocol) {
            self.budetService = budetService
        }
    }
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    
    // MARK: - Lifecycle
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    public func makeCoordinator(navigationController: UINavigationController) -> EditTagSceneCoordinator {
        EditTagSceneCoordinator(navigationController: navigationController,
                                dependencies: self)
    }
}

// MARK: - EditTagSceneCoordinatorDependencies -

extension EditTagSceneDIContainer: EditTagSceneCoordinatorDependencies {
    
    // MARK: - Properties
    
    var budetService: BudgetServiceProtocol { dependencies.budetService }
    
}
