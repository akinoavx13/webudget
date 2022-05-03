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

protocol TagDetailsSceneCoordinatorDependencies: AnyObject { }

public final class TagDetailsSceneCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
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
    public func start(params: Any...) {
        let viewModel = TagDetailsSceneViewModel()
        viewModel.coordinator = self
        
        let viewController = UIHostingController(rootView: TagDetailsScene(viewModel: viewModel))
        
        navigationController.present(viewController, animated: true)
    }
    
    public func stop() { fatalError("Should not be stopped.") }
}
