//
//  TagListSceneCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 02/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit.UINavigationController
import SwiftUI
import Core
import BudgetService
import TagDetailsFeature

protocol TagListSceneCoordinatorDependencies: AnyObject {
    
    // MARK: - Properties
    
    var budetService: BudgetServiceProtocol { get }
    var tagDetailsSceneDIContainer: TagDetailsSceneDIContainer { get }
}

public final class TagListSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    public var parentCoordinator: CoordinatorProtocol?
    public var children: [CoordinatorProtocol] = []
    
    private let navigationController: UINavigationController
    private let dependencies: TagListSceneCoordinatorDependencies
    private var viewModel: TagListSceneViewModel?
    
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController,
         dependencies: TagListSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    // MARK: - Methods
    
    @MainActor
    public func start(params: Any?...) {
        viewModel = TagListSceneViewModel(budgetService: dependencies.budetService)
        
        guard let viewModel = viewModel else { fatalError("Could not find TagListSceneViewModel") }
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: TagListScene(viewModel: viewModel))
        viewController.title = Translator.tags
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
    
    @MainActor
    func presentTagDetails(uuid: UUID?) {
        let coordinator = dependencies
            .tagDetailsSceneDIContainer
            .makeCoordinator(navigationController: navigationController)
        
        children.append(coordinator)
        coordinator.delegate = self
        coordinator.start(params: uuid)
    }
}

// MARK: - TagDetailsSceneCoordinatorDelegate -

extension TagListSceneCoordinator: TagDetailsSceneCoordinatorDelegate {
    @MainActor
    public func tagDetailsSceneCoordinatorNeedRefreshTags(_ sender: TagDetailsSceneCoordinator) {
        viewModel?.fetchTags()
    }
}
