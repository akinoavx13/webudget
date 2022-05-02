//
//  AnimatedButtonStyle.swift
//  
//
//  Created by Maxime Maheo on 30/04/2022.
//

import SwiftUI

public struct AnimatedButtonStyle: ButtonStyle {
    
    // MARK: - Properties
    
    let backgroundColors: [Color]
    let foregroundColor: Color
    let cornerRadius: CGFloat
    let paddingOffset: CGFloat
    let strokeColors: [Color]
    let strokeWidth: CGFloat
    let backgroundShadowColor: Color
    let topInnerShadowColor: Color
    let bottomInnerShadowColor: Color
    
    // MARK: - Lifecycle
    
    public init(backgroundColors: [Color] = [],
                foregroundColor: Color = .primary,
                cornerRadius: CGFloat = 0,
                paddingOffset: CGFloat = 16,
                strokeColors: [Color] = [],
                strokeWidth: CGFloat = 0,
                backgroundShadowColor: Color = .clear,
                topInnerShadowColor: Color = .clear,
                bottomInnerShadowColor: Color = .clear) {
        self.backgroundColors = backgroundColors
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.paddingOffset = paddingOffset
        self.strokeColors = strokeColors
        self.strokeWidth = strokeWidth
        self.backgroundShadowColor = backgroundShadowColor
        self.topInnerShadowColor = topInnerShadowColor
        self.bottomInnerShadowColor = bottomInnerShadowColor
    }
    
    // MARK: - Methods
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(foregroundColor)
            .padding(paddingOffset)
            .background(LinearGradient(colors: backgroundColors,
                                       startPoint: .leading,
                                       endPoint: .trailing))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius,
                                        style: .continuous))
            .shadow(color: backgroundShadowColor,
                    radius: 3,
                    x: 0,
                    y: 3)
            .overlay(
                ZStack {
                    VStack {
                        Rectangle()
                            .fill(topInnerShadowColor)
                            .frame(height: 2)
                            .blur(radius: 2)
                        
                        Spacer()
                        
                        Rectangle()
                            .fill(bottomInnerShadowColor)
                            .frame(height: 2)
                            .blur(radius: 2)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius,
                                                style: .continuous))
                    
                    RoundedRectangle(cornerRadius: cornerRadius,
                                     style: .continuous)
                    .strokeBorder(LinearGradient(colors: strokeColors,
                                                 startPoint: .leading,
                                                 endPoint: .trailing),
                                  lineWidth: strokeWidth)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6),
                       value: configuration.isPressed)
    }
    
}

#if DEBUG

struct AnimatedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press me") { }
            .buttonStyle(AnimatedButtonStyle())
            .previewLayout(.fixed(width: 200, height: 200))
    }
}

#endif
