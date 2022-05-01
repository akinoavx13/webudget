//
//  AppDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 21/04/2022.
//

import TransactionFeature
import FormatterService
import BudgetService

final class AppDIContainer {
    
    // MARK: - Services

    private(set) lazy var formatterService: FormatterServiceProtocol = FormatterService()
    private(set) lazy var budgetService: BudgetServiceProtocol = BudgetService()
    
    // MARK: - Containers
    
    private(set) lazy var transactionSceneDIContainer: TransactionSceneDIContainer = {
        let dependencies = TransactionSceneDIContainer.Dependencies(formatterService: formatterService,
                                                                    budgetService: budgetService)

        return TransactionSceneDIContainer(dependencies: dependencies)
    }()
}
