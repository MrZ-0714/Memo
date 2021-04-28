//
//  EmojiMemoryGame.swift
//  Memo
//
//  Created by Zimo Zhao on 4/27/21.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🧛🏻‍♀️","🗽","📷","🦠","💊"]
        let emojisToUse = emojis.shuffled()[0...Int.random(in: 1...4)]
        return MemoryGame<String>(numberOfPairsOfCards: emojisToUse.count) { pairIndex in
            return emojisToUse[pairIndex]
        }
    }

    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
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
