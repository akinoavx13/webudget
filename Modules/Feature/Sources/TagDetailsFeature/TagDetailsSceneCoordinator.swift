//
//  TagDetailsSceneCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 03/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core
import BudgetService

public protocol TagDetailsSceneCoordinatorDelegate: AnyObject {
    func tgagDetailsSceneCoordinatorDidStop(_ sender: TagDetailsSceneCoordinator)
}

protocol TagDetailsSceneCoordinatorDependencies: AnyObject {
    
    // MARK: - Properties
    
    var budgetService: BudgetServiceProtocol { get }
    
}

public final class TagDetailsSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public weak var delegate: TagDetailsSceneCoordinatorDelegate?
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: TagDetailsSceneCoordinatorDependencies

    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: TagDetailsSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    @MainActor
    public func start(params: Any?...) {
        guard let id = params.first as? UUID else { fatalError("Could not find tag id") }
        
        let viewModel = TagDetailsSceneViewModel(budgetService: dependencies.budgetService,
                                                 id: id)
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: TagDetailsScene(viewModel: viewModel))
        
        navigationController.present(viewController, animated: true)
    }
    
    public func stop() {
        delegate?.tgagDetailsSceneCoordinatorDidStop(self)
        navigationController.dismiss(animated: true)
        parentCoordinator?.childDidStop(self)
    }
}
