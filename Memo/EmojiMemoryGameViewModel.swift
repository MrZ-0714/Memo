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
        //Use a random theme
        let chosenTheme: GameTheme = GameTheme.themes.randomElement()!
        
        let emojis: Array<String> = chosenTheme.emojis
        let numberOfCardToShow = chosenTheme.numberOfCardsToShow ?? Int.random(in: 1...emojis.count)
        let emojisToUse = emojis.shuffled()[0...numberOfCardToShow]
        return MemoryGameModel<String>(numberOfPairsOfCards: emojisToUse.count) { pairIndex in
            return emojisToUse[pairIndex]
        }
    }

    //MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards
    }

    //MARK: - Intent(s)
    func choose(card: MemoryGameModel<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
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
