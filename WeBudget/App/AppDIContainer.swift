//
//  AppDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 21/04/2022.
//

import TransactionFeature

final class AppDIContainer {
    
    // MARK: - Services

    // MARK: - Containers
    
    private(set) lazy var transactionSceneDIContainer: TransactionSceneDIContainer = {
        let dependencies = TransactionSceneDIContainer.Dependencies()

        return TransactionSceneDIContainer(dependencies: dependencies)
    }()
}
