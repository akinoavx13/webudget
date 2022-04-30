//
//  AppCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 21/04/2022.
//

import UIKit
import Core

final class AppCoordinator {
    
    // MARK: - Properties
    
    var children: [CoordinatorProtocol] = []
    
    private let window: UIWindow
    private let launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    private let appDIContainer = AppDIContainer()

    // MARK: - Lifecycle
    
    init(window: UIWindow,
         launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.window = window
        self.launchOptions = launchOptions
    }
    
    // MARK: - Methods
    
    func start() {
        setupBeforeLaunch()
        
        showMain()
        
        window.makeKeyAndVisible()
        
        setupAfterLaunch()
    }
    
    // MARK: - Private methods
    
    private func showMain() {
        let coordinator = TabBarCoordinator(window: window,
                                            appDIContainer: appDIContainer)
        children = [coordinator]
        coordinator.start()
    }

    private func setupBeforeLaunch() { }
    
    private func setupAfterLaunch() { }
}
