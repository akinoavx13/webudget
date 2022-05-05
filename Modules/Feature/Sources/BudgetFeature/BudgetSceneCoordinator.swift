//
//  BudgetSceneCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 05/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core

protocol BudgetSceneCoordinatorDependencies: AnyObject { }

public final class BudgetSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: BudgetSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: BudgetSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    @MainActor
    public func start(params: Any?...) {
        let viewModel = BudgetSceneViewModel()
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: BudgetScene(viewModel: viewModel))
        viewController.title = Translator.budget
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
