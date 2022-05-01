//
//  AmountComponent.swift
//  
//
//  Created by Maxime Maheo on 30/04/2022.
//

import SwiftUI

struct AmountComponent: View {
    
    struct Model {
        let amount: String
    }
    
    // MARK: - Properties
    
    let model: Model
    
    // MARK: - Body
    
    var body: some View {
        Text(model.amount)
            .foregroundColor(.primary)
            .font(.system(size: 70))
            .fontWeight(.bold)
            .lineLimit(1)
            .minimumScaleFactor(0.3)
            .padding(.horizontal)
    }
}

struct AmountComponent_Previews: PreviewProvider {
    static var previews: some View {
        AmountComponent(model: AmountComponent.Model(amount: "$ 5"))
        
            .previewLayout(.fixed(width: 340, height: 140))
            .padding(20)
    }
}
