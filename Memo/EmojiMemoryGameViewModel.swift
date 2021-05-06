//
//  EmojiMemoryGameViewModel.swift
//  Memo
//
//  Created by Zimo Zhao on 4/27/21.
//

import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGameModel<String> = EmojiMemoryGameViewModel.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        //5. A new theme should be able to be added to your game with a single line of code.
        let chosenTheme: GameTheme = GameTheme.themes.randomElement()!
        let emojis: Array<String> = chosenTheme.emojis
        let numberOfCardToShow = chosenTheme.numberOfCardsToShowMinusOne ?? Int.random(in: 1...emojis.count - 1)
        let emojisToUse = emojis.shuffled()[0...numberOfCardToShow]
        return MemoryGameModel<String>(numberOfPairsOfCards: emojisToUse.count, chosenTheme: chosenTheme) { pairIndex in
            return emojisToUse[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var chosenTheme: GameTheme {
        model.chosenTheme
    }

    //MARK: - Intent(s)
    func choose(card: MemoryGameModel<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func startNewGame() {
        model = EmojiMemoryGameViewModel.createMemoryGame()
    }
}


// The full form of the functions being passed around.
//func createCardContent(pairIndex: Int) -> String {
//    return "STRING"
//}
//
//class EmojiMemoryGame {
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent)
//
//    var cards: Array<MemoryGame<String>.Card> {
//        model.cards
//    }
//
//    func choose(card: MemoryGame<String>.Card) {
//        model.choose(card: card)
//    }
//}
