//
//  TransactionSceneViewModel.swift
//  WeBudget
//
//  Created by Maxime Maheo on 30/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import FormatterService
import Core

@MainActor
final class TransactionSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    
    weak var coordinator: TransactionSceneCoordinator?
    
    @Published private(set) var amountModel: AmountComponent.Model?
    @Published private(set) var keyboardModel: KeyboardComponent.Model?
    @Published private(set) var sourceModel: SourceComponent.Model?
    
    private var transactionAmount: Int = 0 {
        didSet {
            let amount = formatterService.formatCurrency(value: transactionAmount)

            amountModel = AmountComponent.Model(amount: amount)
            keyboardModel = KeyboardComponent.Model(isDeleteButtonDisabled: transactionAmount <= 0,
                                                    isValidateButtonDisabled: transactionAmount <= 0)
        }
    }
    
    private let formatterService: FormatterServiceProtocol
    
    // MARK: - Lifecycle
    
    init(formatterService: FormatterServiceProtocol) {
        self.formatterService = formatterService
                
        amountModel = AmountComponent.Model(amount: formatterService.formatCurrency(value: transactionAmount))
        keyboardModel = KeyboardComponent.Model(isDeleteButtonDisabled: true,
                                                isValidateButtonDisabled: true)
        sourceModel = SourceComponent.Model(isExpenseSelected: true)
    }
    
    // MARK: - Methods
    
    func numberDidTapAction(value: Int) {
        guard transactionAmount <= 1_000_000_000_000 else { return }

        transactionAmount = transactionAmount * 10 + value
    }
    
    func deleteDidTapAction() {
        transactionAmount /= 10
    }
    
    func validateDidTapAction() {
        dd("validate")
    }
    
    func expenseDidTapAction() {
        sourceModel = SourceComponent.Model(isExpenseSelected: true)
    }
    
    func incomeDidTapAction() {
        sourceModel = SourceComponent.Model(isExpenseSelected: false)
    }
}

#if DEBUG

extension TransactionSceneViewModel {
    static let preview = TransactionSceneViewModel(formatterService: FormatterService())
}

#endif
