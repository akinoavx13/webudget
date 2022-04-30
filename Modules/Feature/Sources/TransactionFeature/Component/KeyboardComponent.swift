//
//  KeyboardComponent.swift
//  
//
//  Created by Maxime Maheo on 30/04/2022.
//

import SwiftUI
import SharedUI

struct KeyboardComponent: View {
    
    struct Model {
        let isDeleteButtonDisabled: Bool
        let isValidateButtonDisabled: Bool
    }
    
    // MARK: - Properties
    
    let model: Model
    
    let numberDidTapAction: @MainActor (Int) -> Void
    let deleteDidTapAction: @MainActor () -> Void
    let validateDidTapAction: @MainActor () -> Void
    
    private let impactGenerator = UIImpactFeedbackGenerator(style: .light)
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                makeTitleButtonView(title: "1") { numberDidTapAction(1) }
                makeTitleButtonView(title: "2") { numberDidTapAction(2) }
                makeTitleButtonView(title: "3") { numberDidTapAction(3) }
            }
            HStack {
                makeTitleButtonView(title: "4") { numberDidTapAction(4) }
                makeTitleButtonView(title: "5") { numberDidTapAction(5) }
                makeTitleButtonView(title: "6") { numberDidTapAction(6) }
            }
            HStack {
                makeTitleButtonView(title: "7") { numberDidTapAction(7) }
                makeTitleButtonView(title: "8") { numberDidTapAction(8) }
                makeTitleButtonView(title: "9") { numberDidTapAction(9) }
            }
            HStack {
                makeIconButtonView(icon: "delete.left",
                                   tint: .red,
                                   isDisabled: model.isDeleteButtonDisabled) { deleteDidTapAction() }
                makeTitleButtonView(title: "0") { numberDidTapAction(0) }
                makeIconButtonView(icon: "checkmark.circle.fill",
                                   tint: .accentColor,
                                   isDisabled: model.isValidateButtonDisabled) { validateDidTapAction() }
            }
        }
    }
    
    // MARK: - Make views
    
    private func makeTitleButtonView(title: String,
                                     action: @escaping () -> Void) -> some View {
        Button {
            action()
            impactGenerator.impactOccurred()
        } label: {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(AnimatedButtonStyle(backgroundColors: [.secondary.opacity(0.1)],
                                         cornerRadius: 8))
    }
    
    private func makeIconButtonView(icon: String,
                                    tint: Color,
                                    isDisabled: Bool,
                                    action: @escaping () -> Void) -> some View {
        Button {
            action()
            impactGenerator.impactOccurred()
        } label: {
            Image(systemName: isDisabled ? icon.replacingOccurrences(of: ".fill", with: "") : icon)
                .font(.headline)
                .foregroundColor(isDisabled ? .gray : tint)
                .opacity(isDisabled ? 0.5 : 1)
                .frame(maxWidth: .infinity)
        }
        .disabled(isDisabled)
        .buttonStyle(AnimatedButtonStyle(backgroundColors: [.secondary.opacity(0.1)],
                                         cornerRadius: 8))
    }
}

#if DEBUG

struct KeyboardComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KeyboardComponent(model: KeyboardComponent.Model(isDeleteButtonDisabled: false,
                                                             isValidateButtonDisabled: false),
                              numberDidTapAction: { _ in },
                              deleteDidTapAction: { },
                              validateDidTapAction: { })
            
            KeyboardComponent(model: KeyboardComponent.Model(isDeleteButtonDisabled: false,
                                                             isValidateButtonDisabled: false),
                              numberDidTapAction: { _ in },
                              deleteDidTapAction: { },
                              validateDidTapAction: { })
            .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375,
                              height: 375))
    }
}

#endif
