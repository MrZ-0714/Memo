//
//  ViewModifier-Cardify.swift
//  Memo
//
//  Created by Zimo Zhao on 5/10/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: CornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: CornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: CornerRadius).fill()
            }
        }
        
    }
    
    //MARK: - Drawing Constants
    private let CornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    private let FontScaleFactor: CGFloat = 0.7
    private let ShapeOpacity: Double = 0.44
    
}
