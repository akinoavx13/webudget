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
        let dependencies = TagListSceneDIContainer.Dependencies(budetService: budgetService)

        return TagListSceneDIContainer(dependencies: dependencies)
    }()
}
