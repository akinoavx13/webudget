//
//  TransactionScene.swift
//  WeBudget
//
//  Created by Maxime Maheo on 30/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct TransactionScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TransactionSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            
            viewModel
                .amountModel
                .map {
                    AmountComponent(model: $0)
                }
            
            Spacer()
            
            viewModel
                .sourceModel
                .map { SourceComponent(model: $0,
                                       expenseDidTapAction: viewModel.expenseDidTapAction,
                                       incomeDidTapAction: viewModel.incomeDidTapAction) }
            
            viewModel
                .keyboardModel
                .map {
                    KeyboardComponent(model: $0,
                                      numberDidTapAction: viewModel.numberDidTapAction(value:),
                                      deleteDidTapAction: viewModel.deleteDidTapAction,
                                      validateDidTapAction: viewModel.validateDidTapAction)
                }
        }
        .padding()
    }
}

#if DEBUG

struct TransactionScene_Previews: PreviewProvider {
    static var previews: some View {
        TransactionScene(viewModel: TransactionSceneViewModel.preview)
    }
}

#endif
