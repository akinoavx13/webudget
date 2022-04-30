//
//  AppDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 21/04/2022.
//

import TransactionFeature
import FormatterService
final class AppDIContainer {
    
    // MARK: - Services

    private(set) lazy var formatterService: FormatterServiceProtocol = FormatterService()
    
    // MARK: - Containers
    
    private(set) lazy var transactionSceneDIContainer: TransactionSceneDIContainer = {
        let dependencies = TransactionSceneDIContainer.Dependencies(formatterService: formatterService)

        return TransactionSceneDIContainer(dependencies: dependencies)
    }()
}
