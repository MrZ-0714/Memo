//
//  ContentView.swift
//  Memo
//
//  Created by Zimo Zhao on 4/26/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
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
        .font(viewModel.cards.count < 5 ? .largeTitle : .body)
    } 
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 20.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 20.0).stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 20.0).fill()
            }
        }
        //Change the aspect ratio to 2:3
        .aspectRatio(2/3, contentMode: .fit)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        return ContentView(viewModel: EmojiMemoryGame())
//    }
//}
