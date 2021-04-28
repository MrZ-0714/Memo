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
        VStack {
            ForEach(0..<4) { index in
                HStack {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
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
    }
}
