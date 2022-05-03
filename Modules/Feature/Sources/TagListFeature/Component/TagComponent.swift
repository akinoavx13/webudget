//
//  TagComponent.swift
//  
//
//  Created by Maxime Maheo on 02/05/2022.
//

import SwiftUI

struct TagComponent: View {
    
    struct Model: Identifiable {
        let id: UUID
        let title: String
        let subtitle: String
    }

    // MARK: - Properties
    
    let model: Model
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: 6) {
                Text(model.title)
                
                Text(model.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "info.circle")
                .foregroundColor(.accentColor)
        }
    }
}

#if DEBUG

struct TagComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TagComponent(model: TagComponent.Model(id: UUID(),
                                                   title: "Groceries 🛒",
                                                   subtitle: "10 transactions"))
            
            TagComponent(model: TagComponent.Model(id: UUID(),
                                                   title: "Groceries 🛒",
                                                   subtitle: "10 transactions"))
            .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375,
                              height: 80))
    }
}

#endif
