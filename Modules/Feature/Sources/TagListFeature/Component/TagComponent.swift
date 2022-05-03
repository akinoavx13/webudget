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
    }

    // MARK: - Properties
    
    let model: Model
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text(model.title)
            
            Spacer()
            
            Image(systemName: "info.circle")
                .foregroundColor(.accentColor)
        }
    }
}

#if DEBUG

struct TagComponent_Previews: PreviewProvider {
    static var previews: some View {
        TagComponent(model: TagComponent.Model(id: UUID(),
                                               title: "Groceries 🛒"))
    }
}

#endif
