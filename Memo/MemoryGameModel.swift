//
//  MemoryGameModel.swift
//  Memo
//
//  Created by Zimo Zhao on 4/27/21.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatcchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatcchIndex].content  {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatcchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
        }
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
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
