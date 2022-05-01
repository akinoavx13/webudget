//
//  HistorySceneCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 01/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core
import BudgetService
import FormatterService

protocol HistorySceneCoordinatorDependencies: AnyObject {
    
    // MARK: - Properties
    
    var budgetService: BudgetServiceProtocol { get }
    var formatterService: FormatterServiceProtocol { get }
}

public final class HistorySceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: HistorySceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: HistorySceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    @MainActor
    public func start(params: Any...) {
        let viewModel = HistorySceneViewModel(budgetService: dependencies.budgetService,
                                              formatterService: dependencies.formatterService)
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: HistoryScene(viewModel: viewModel))
        viewController.title = Translator.history
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
