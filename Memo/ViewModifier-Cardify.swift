//
//  ViewModifier-Cardify.swift
//  Memo
//
//  Created by Zimo Zhao on 5/10/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    init (isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation}
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: CornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: CornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: CornerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        
    }
    
    //MARK: - Drawing Constants
    private let CornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    private let FontScaleFactor: CGFloat = 0.7
    private let ShapeOpacity: Double = 0.44
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
