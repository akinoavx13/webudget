//
//  EditTagSceneCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 02/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core
import BudgetService

protocol EditTagSceneCoordinatorDependencies: AnyObject {
    
    // MARK: - Properties
    
    var budetService: BudgetServiceProtocol { get }
    
}

public final class EditTagSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: EditTagSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: EditTagSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    @MainActor
    public func start(params: Any...) {
        let viewModel = EditTagSceneViewModel(budgetService: dependencies.budetService)
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: EditTagScene(viewModel: viewModel))
        viewController.title = Translator.editTags
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
