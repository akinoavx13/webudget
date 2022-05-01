//
//  SourceComponent.swift
//  
//
//  Created by Maxime Maheo on 30/04/2022.
//

import SwiftUI
import SharedUI
import Core

struct SourceComponent: View {
    
    struct Model {
        let isExpenseSelected: Bool
    }
    
    // MARK: - Properties
    
    let model: Model
    
    let expenseDidTapAction: @MainActor () -> Void
    let incomeDidTapAction: @MainActor () -> Void
    
    private let impactGenerator = UIImpactFeedbackGenerator(style: .light)

    // MARK: - Body
    
    var body: some View {
        HStack {
            Button {
                expenseDidTapAction()
                impactGenerator.impactOccurred()
            } label: {
                Text(Translator.expense)
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(AnimatedButtonStyle(backgroundColors: [.red.opacity(model.isExpenseSelected ? 0.5 : 0.1)],
                                             foreground: model.isExpenseSelected ? .white : .red,
                                             cornerRadius: 8,
                                             strokeColors: [.red.opacity(model.isExpenseSelected ? 0.5 : 0.1)],
                                             strokeWidth: 2))
            
            Button {
                incomeDidTapAction()
                impactGenerator.impactOccurred()
            } label: {
                Text(Translator.income)
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(AnimatedButtonStyle(backgroundColors: [.green.opacity(model.isExpenseSelected ? 0.1 : 0.5)],
                                             foreground: model.isExpenseSelected ? .green : .white,
                                             cornerRadius: 8,
                                             strokeColors: [.green.opacity(model.isExpenseSelected ? 0.1 : 0.5 )],
                                             strokeWidth: 2))
        }
    }
}

#if DEBUG

struct SourceComponent_Previews: PreviewProvider {
    static var previews: some View {
        SourceComponent(model: SourceComponent.Model(isExpenseSelected: true),
                        expenseDidTapAction: { },
                        incomeDidTapAction: { })
            .previewLayout(.fixed(width: 375, height: 100))
    }
}

#endif
