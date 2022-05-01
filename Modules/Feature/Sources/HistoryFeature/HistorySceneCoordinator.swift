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

protocol HistorySceneCoordinatorDependencies: AnyObject { }

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
        let viewModel = HistorySceneViewModel()
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: HistoryScene(viewModel: viewModel))
        viewController.title = "§History"
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([viewController],
                                                animated: false)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
