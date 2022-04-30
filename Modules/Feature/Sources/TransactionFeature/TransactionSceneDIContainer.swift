//
//  TransactionSceneDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 30/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController

public final class TransactionSceneDIContainer {
    
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
    
    public func makeCoordinator(navigationController: UINavigationController) -> TransactionSceneCoordinator {
        TransactionSceneCoordinator(navigationController: navigationController,
                                    dependencies: self)
    }
}

// MARK: - TransactionSceneCoordinatorDependencies -

extension TransactionSceneDIContainer: TransactionSceneCoordinatorDependencies { }
