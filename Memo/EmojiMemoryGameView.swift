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
        HStack {
            ForEach(viewModel.cards.shuffled()) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
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
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: CornerRadius).fill()
                }
            }
            //Change the aspect ratio to 2:3
            .aspectRatio(2/3, contentMode: .fit)
            .font(Font.system(size: min(geometry.size.height, geometry.size.width) * FontScaleFactor))
        }
    }
    
    //MARK: - Drawing Constants
    let CornerRadius: CGFloat = 10
    let LineWidth: CGFloat = 3
    let FontScaleFactor: CGFloat = 0.75
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        return ContentView(viewModel: EmojiMemoryGame())
//    }
//}
