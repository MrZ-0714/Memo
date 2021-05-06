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
        VStack {
            HStack{
                // 7. Show the theme’s name somewhere in your UI.
                Text(viewModel.chosenTheme.name).font(.title)
                HStack(spacing: 1.0){
                    Text("Score: ").font(.body).multilineTextAlignment(.trailing)
                    Text("\(viewModel.score)").multilineTextAlignment(.leading)
                }
                .padding([.top, .leading, .trailing])
            }
            
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
                //Change the aspect ratio to 2:3
                .aspectRatio(2/3, contentMode: .fit)
            }
            .padding()
            .foregroundColor(viewModel.chosenTheme.color)
            /*
             6. Add a “New Game” button to your UI which begins a brand new game.
             This new game should have a randomly chosen theme.
             You can put this button anywhere you think looks best in your UI.
             */
            Button("New Game"){
                print("NewGame pressed")
                viewModel.startNewGame()
            }
        }
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
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: CornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.height, geometry.size.width) * FontScaleFactor))
        }
    }
    
    //MARK: - Drawing Constants
    let CornerRadius: CGFloat = 10
    let LineWidth: CGFloat = 3
    let FontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
        }
    }
}
