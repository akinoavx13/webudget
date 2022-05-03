//
//  TagDetailsSceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 03/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine

@MainActor
final class TagDetailsSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: TagDetailsSceneCoordinator?
}

#if DEBUG

extension TagDetailsSceneViewModel {
    static let preview = TagDetailsSceneViewModel()
}

#endif
