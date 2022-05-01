//
//  TransactionSceneCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 30/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core
import FormatterService
import BudgetService

protocol TransactionSceneCoordinatorDependencies: AnyObject {
    
    // MARK: - Properties
    
    var formatterService: FormatterServiceProtocol { get }
    var budgetService: BudgetServiceProtocol { get }
}

public final class TransactionSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: TransactionSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: TransactionSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    @MainActor
    public func start(params: Any...) {
        let viewModel = TransactionSceneViewModel(formatterService: dependencies.formatterService,
                                                  budgetService: dependencies.budgetService)
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: TransactionScene(viewModel: viewModel))
        viewController.title = Translator.transaction
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
