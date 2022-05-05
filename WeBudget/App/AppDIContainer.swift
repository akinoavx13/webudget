//
//  AppDIContainer.swift
//  WeBudget
//
//  Created by Maxime Maheo on 21/04/2022.
//

import TransactionFeature
import FormatterService
import BudgetService
import HistoryFeature
import TagListFeature
import TagDetailsFeature
import BudgetFeature

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
    
    private(set) lazy var historySceneDIContainer: HistorySceneDIContainer = {
        let dependencies = HistorySceneDIContainer.Dependencies(budgetService: budgetService,
                                                                formatterService: formatterService)

        return HistorySceneDIContainer(dependencies: dependencies)
    }()
    
    private(set) lazy var tagListSceneDIContainer: TagListSceneDIContainer = {
        let dependencies = TagListSceneDIContainer.Dependencies(budetService: budgetService,
                                                                tagDetailsSceneDIContainer: tagDetailsSceneDIContainer)

        return TagListSceneDIContainer(dependencies: dependencies)
    }()
    
    private(set) lazy var tagDetailsSceneDIContainer: TagDetailsSceneDIContainer = {
        let dependencies = TagDetailsSceneDIContainer.Dependencies(budgetService: budgetService)

        return TagDetailsSceneDIContainer(dependencies: dependencies)
    }()
    
    private(set) lazy var budgetSceneDIContainer: BudgetSceneDIContainer = {
        let dependencies = BudgetSceneDIContainer.Dependencies()

        return BudgetSceneDIContainer(dependencies: dependencies)
    }()
}
