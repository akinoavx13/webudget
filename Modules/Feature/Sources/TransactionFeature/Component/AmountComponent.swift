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
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.accentColor)
                .shadow(radius: 5)
            
            Text(model.amount)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal)
        }
        .frame(width: 300,
               height: 125)
    }
}

struct AmountComponent_Previews: PreviewProvider {
    static var previews: some View {
        AmountComponent(model: AmountComponent.Model(amount: "$ 5"))
            
            .previewLayout(.fixed(width: 340, height: 140))
            .padding(20)
    }
}
