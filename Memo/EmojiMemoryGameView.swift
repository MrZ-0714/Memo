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
                    withAnimation(.linear){
                        viewModel.choose(card: card)
                    }
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
                withAnimation(.easeInOut(duration: 1)) {
                    viewModel.startNewGame()
                }
                print("NewGame pressed")
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation () {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Group {
                        if card.isConsumingBonusTime {
                            CustomShapePie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees( animatedBonusRemaining * 360 - 90), clockwise: true)
                                .onAppear {
                                    startBonusTimeAnimation()
                                }
                        } else {
                            CustomShapePie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees( card.bonusRemaining * 360 - 90), clockwise: true)
                        }
                        
                    }
                    .padding(5).opacity(ShapeOpacity)
                    Text(card.content).font(Font.system(size: min(geometry.size.height, geometry.size.width) * FontScaleFactor))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
        }
    }
    
    //MARK: - Drawing Constants
    private let CornerRadius: CGFloat = 10
    private let LineWidth: CGFloat = 3
    private let FontScaleFactor: CGFloat = 0.7
    private let ShapeOpacity: Double = 0.44
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
