//
//  MemoryGameModel.swift
//  Memo
//
//  Created by Zimo Zhao on 4/27/21.
//

import Foundation

struct MemoryGameModel<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0...cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return -1 //TODO: bogus
    }
    
    //Init function. A struct can have multiple init function. 
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            //The MemoryGame initializer, init itself with a function passed in to tell what the card content is.
            let content: CardContent = cardContentFactory(pairIndex)
            //Append card to cards array.
            cards.append(Card(id:pairIndex*2, content: content))
            cards.append(Card(id:pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }
}
