//
//  MemoryGameModel.swift
//  Memo
//
//  Created by Zimo Zhao on 4/27/21.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    var chosenTheme: GameTheme
    var score: Int = 0
    
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
                    //8. Keep score in your game by giving 2 points for every match and
                    score += 2
                } else if (cards[chosenIndex].previouslySeen || cards[potentialMatcchIndex].previouslySeen) {
                    //8. penalizing 1 point for every previously seen card that is involved in a mismatch.
                    score -= 1
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].previouslySeen = true
                cards[potentialMatcchIndex].previouslySeen = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    //Init function. A struct can have multiple init function. 
    init(numberOfPairsOfCards: Int, chosenTheme: GameTheme, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        self.chosenTheme = chosenTheme
        for pairIndex in 0..<numberOfPairsOfCards {
            //The MemoryGame initializer, init itself with a function passed in to tell what the card content is.
            let content: CardContent = cardContentFactory(pairIndex)
            //Append card to cards array.
            cards.append(Card(id:pairIndex*2, content: content))
            cards.append(Card(id:pairIndex*2+1, content: content))
        }
        //2. Your game should still shuffle the cards.
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        var previouslySeen: Bool = false
        
        //MARK: - Bonus Time
        var bonusTimeLimit: TimeInterval = 6
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = lastFaceUpDate {
                return pastFaceUpDate + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpDate
            }
        }
        
        var lastFaceUpDate: Date?
        var pastFaceUpDate: TimeInterval = 0
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastFaceUpDate = faceUpTime
            lastFaceUpDate = nil
        }
        
    }
}
