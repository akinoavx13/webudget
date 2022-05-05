//
//  BudgetSceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 05/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine

@MainActor
final class BudgetSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: BudgetSceneCoordinator?
}

#if DEBUG

extension BudgetSceneViewModel {
    static let preview = BudgetSceneViewModel()
}

#endif
