//
//  EmojiMemoryGameView.swift
//  Memo
//
//  Created by Zimo Zhao on 4/26/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(5)
            //Change the aspect ratio to 2:3
            .aspectRatio(2/3, contentMode: .fit)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: CornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: CornerRadius).stroke(lineWidth: LineWidth)
                    Circle()
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: CornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.height, geometry.size.width) * FontScaleFactor))
        }
    }
    
    //MARK: - Drawing Constants
    private let CornerRadius: CGFloat = 10
    private let LineWidth: CGFloat = 3
    private let FontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
