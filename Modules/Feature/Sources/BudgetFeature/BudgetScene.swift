//
//  BudgetScene.swift
//  WeBudget
//
//  Created by Maxime Maheo on 05/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct BudgetScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: BudgetSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Text("Hello, World")
    }
}

#if DEBUG

struct BudgetScene_Previews: PreviewProvider {
    static var previews: some View {
        BudgetScene(viewModel: BudgetSceneViewModel.preview)
    }
}

#endif
