//
//  HistorySceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 01/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine

@MainActor
final class HistorySceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: HistorySceneCoordinator?
}

#if DEBUG

extension HistorySceneViewModel {
    static let preview = HistorySceneViewModel()
}

#endif
