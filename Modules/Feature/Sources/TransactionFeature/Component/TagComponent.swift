//
//  TagComponent.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import SwiftUI
import SharedUI
import Core

struct TagComponent: View {
    
    struct Model: Identifiable, Equatable {
        let id: UUID
        let title: String
        let isSelected: Bool
    }
    
    // MARK: - Properties

    let models: [Model]
    
    let tagDidTapAction: @MainActor (UUID) -> Void
    let editTagsDidTapAction: @MainActor () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            LazyHStack {
                ForEach(models) { model in
                    if models.first == model {
                        makeButtonTagView(model: model)
                            .padding(.leading, 16)
                    } else {
                        makeButtonTagView(model: model)
                    }
                }
                
                Button(Translator.editTags) { editTagsDidTapAction() }
                    .buttonStyle(AnimatedButtonStyle(backgroundColors: [colorScheme == .dark ? .black : .white],
                                                     cornerRadius: 8,
                                                     paddingOffset: 12,
                                                     strokeColors: [colorScheme == .dark ?
                                                        .white.opacity(0.3) :
                                                            .black.opacity(0.3)],
                                                     strokeWidth: 1))
                    .padding(.trailing, 16)
                    .padding(.leading, models.isEmpty ? 16 : 0)
            }
            .frame(height: 48)
        }
    }
    
    // MARK: - Make views
    
    @MainActor
    private func makeButtonTagView(model: Model) -> some View {
        Button {
            tagDidTapAction(model.id)
        } label: {
            Text(model.title)
                .fontWeight(model.isSelected ? .bold : .regular)
        }
        .buttonStyle(AnimatedButtonStyle(backgroundColors: [colorScheme == .dark ? .black : .white],
                                         cornerRadius: 8,
                                         paddingOffset: 12,
                                         strokeColors: [colorScheme == .dark ?
                                            .white.opacity(model.isSelected ? 1 : 0.3) :
                                                .black.opacity(model.isSelected ? 1 : 0.3)],
                                         strokeWidth: 1))
    }
}

#if DEBUG

struct TagComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TagComponent(models: [TagComponent.Model(id: UUID(),
                                                     title: "Groceries 🛒",
                                                     isSelected: true)],
                         tagDidTapAction: { _ in },
                         editTagsDidTapAction: { })
            
            TagComponent(models: [TagComponent.Model(id: UUID(),
                                                     title: "Groceries 🛒",
                                                     isSelected: false)],
                         tagDidTapAction: { _ in },
                         editTagsDidTapAction: { })
            .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 378,
                              height: 80))
    }
}

#endif
