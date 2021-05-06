//
//  GameTheme.swift
//  Memo
//
//  Created by Zimo Zhao on 5/5/21.
//

//MARK: - Assignment Requirement
/***
 3.
 Architect the concept of a “theme” into your game.
 A theme consists of
    a name for the theme,
    a set of emoji to use,
    a number of cards to show (which, for at least one, but not all themes, should be random),
    and an appropriate color to use to draw (e.g. orange would be appropriate for a Halloween theme).
 
 4. Support at least 6 different themes in your game.
 ***/
import SwiftUI

//MARK: - GameTheme struct
struct GameTheme {
    let name: String
    let emojis: [String]
    let numberOfCardsToShow: Int?
    let color: SwiftUI.Color
    
    static let animal = GameTheme(name: "Animals", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻"], numberOfCardsToShow: 5, color: .green)
    static let fruit = GameTheme(name: "Fruits", emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉"], numberOfCardsToShow: 5, color: .orange)
    static let ball = GameTheme(name: "Ball", emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐"], numberOfCardsToShow: nil, color: .blue)
    static let car = GameTheme(name: "Cars", emojis: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓"], numberOfCardsToShow: 4, color: .yellow)
    static let apple = GameTheme(name: "iProducts", emojis: ["⌚️","📱","💻","🖥","🖱","⌨️","💡"], numberOfCardsToShow: 7, color: .black)
    static let flag = GameTheme(name: "Flags", emojis: ["🇺🇳","🇨🇳","🇧🇪","🇪🇺","🇪🇸","🇺🇸","🇬🇧"], numberOfCardsToShow: nil, color: .black)
    
    static let themes: [GameTheme] = [animal, fruit, ball, car, apple, flag]
}
