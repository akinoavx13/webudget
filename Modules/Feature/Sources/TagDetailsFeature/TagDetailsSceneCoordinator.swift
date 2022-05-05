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
import Model

public protocol TagDetailsSceneCoordinatorDelegate: AnyObject {
    func tagDetailsSceneCoordinatorNeedRefreshTags(_ sender: TagDetailsSceneCoordinator)
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
        let id = params.first as? UUID
        
        let viewModel = TagDetailsSceneViewModel(budgetService: dependencies.budgetService,
                                                 id: id)
        viewModel.coordinator = self
        viewModel.delegate = self
        
        let viewController = UIHostingController(rootView: TagDetailsScene(viewModel: viewModel))
        
        navigationController.present(viewController, animated: true)
    }
    
    public func stop() {
        navigationController.dismiss(animated: true)
        parentCoordinator?.childDidStop(self)
    }
}

// MARK: - TagDetailsSceneViewModelDelegate -

extension TagDetailsSceneCoordinator: TagDetailsSceneViewModelDelegate {
    func tagDetailsSceneViewModel(_ sender: TagDetailsSceneViewModel,
                                  tagDidSave tag: Tag) {
        delegate?.tagDetailsSceneCoordinatorNeedRefreshTags(self)
    }
    
    func tagDetailsSceneViewModel(_ sender: TagDetailsSceneViewModel,
                                  tagDidDelete tag: Tag) {
        delegate?.tagDetailsSceneCoordinatorNeedRefreshTags(self)
    }
}
