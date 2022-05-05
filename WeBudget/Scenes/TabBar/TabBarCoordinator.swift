//
//  TabBarCoordinator.swift
//  WeBudget
//
//  Created by Maxime Maheo on 21/04/2022.
//

import Core
import UIKit.UINavigationController
import UIKit.UITabBarController

final class TabBarCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?

    private let window: UIWindow
    private let tabBarController = UITabBarController()
    private let appDIContainer: AppDIContainer

    private enum Tab {
        case transaction,
             history,
             tagList,
             budget
    }
    
    // MARK: - Lifecycle
    
    init(window: UIWindow,
         appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }
    
    // MARK: - Methods
    
    func start(params: Any?...) {
        add(tab: .transaction)
        add(tab: .tagList)
        add(tab: .history)
        add(tab: .budget)
        
        window.updateRootViewController(with: tabBarController)
    }
    
    func stop() { fatalError("Should not be stopped.") }
    
    // MARK: - Private methods
    
    private func add(tab: Tab) {
        let navigationController = UINavigationController()
        
        var viewControllers = tabBarController.viewControllers ?? []
        viewControllers += [navigationController]
        
        tabBarController.setViewControllers(viewControllers, animated: true)
        
        let coordinator: CoordinatorProtocol
        
        switch tab {
        case .transaction:
            coordinator = appDIContainer
                .transactionSceneDIContainer
                .makeCoordinator(navigationController: navigationController)
            
            let tabBarItem = UITabBarItem(title: Translator.transaction,
                                          image: UIImage(systemName: "creditcard.fill"),
                                          selectedImage: nil)
            navigationController.tabBarItem = tabBarItem
        case .tagList:
            coordinator = appDIContainer
                .tagListSceneDIContainer
                .makeCoordinator(navigationController: navigationController)
            
            let tabBarItem = UITabBarItem(title: Translator.tags,
                                          image: UIImage(systemName: "tag.fill"),
                                          selectedImage: nil)
            navigationController.tabBarItem = tabBarItem
        case .history:
            coordinator = appDIContainer
                .historySceneDIContainer
                .makeCoordinator(navigationController: navigationController)
            
            let tabBarItem = UITabBarItem(title: Translator.history,
                                          image: UIImage(systemName: "calendar"),
                                          selectedImage: nil)
            navigationController.tabBarItem = tabBarItem
        case .budget:
            coordinator = appDIContainer
                .budgetSceneDIContainer
                .makeCoordinator(navigationController: navigationController)
            
            let tabBarItem = UITabBarItem(title: Translator.budget,
                                          image: UIImage(systemName: "bookmark.fill"),
                                          selectedImage: nil)
            navigationController.tabBarItem = tabBarItem
        }
        
        children.append(coordinator)
        coordinator.start()
    }
}
