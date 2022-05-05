//
//  TransactionComponent.swift
//  
//
//  Created by Maxime Maheo on 01/05/2022.
//

import SwiftUI

struct TransactionComponent: View {
    
    struct Model: Identifiable {
        let id: UUID
        let amount: String
        let date: String
        let isExpense: Bool
        let tagName: String?
    }
    
    // MARK: - Properties
    
    let model: Model
    
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 8) {
            HStack(spacing: 4) {
                Text(model.isExpense ? "-" : "+")
                    .font(.headline)
                    .foregroundColor(model.isExpense ? .red : .green)
                
                Text(model.amount)
                    .font(.headline)
                
                Spacer()
                
                Text(model.date)
                    .foregroundColor(.secondary)
            }
            
            if let tagName = model.tagName {
                Text(tagName)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6,
                                         style: .continuous)
                        .strokeBorder(colorScheme == .dark ? .white.opacity(0.7) : .black.opacity(0.7))
                    }
            }
        }
               .padding(.vertical, 8)
    }
}

#if DEBUG

struct TransactionComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionComponent(model: TransactionComponent.Model(id: UUID(),
                                                                   amount: "$ 5",
                                                                   date: "May 1",
                                                                   isExpense: true,
                                                                   tagName: "Groceries 🛒"))
            
            TransactionComponent(model: TransactionComponent.Model(id: UUID(),
                                                                   amount: "$ 5",
                                                                   date: "May 1",
                                                                   isExpense: true,
                                                                   tagName: "Groceries 🛒"))
            .preferredColorScheme(.dark)
            
        }
        .previewLayout(.fixed(width: 375,
                              height: 80))
    }
}

#endif
